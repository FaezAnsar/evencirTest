import 'package:evencir_test/core/widgets/app_api_consumer.dart';
import 'package:evencir_test/core/widgets/loading_widget.dart';
import 'package:evencir_test/feature/favorites/favorites_cubit.dart';
import 'package:evencir_test/feature/products/cubits/product_detail_cubit.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductDetailCubit()..getProductDetail(productId: productId),
      child: const ProductDetailWidget(),
    );
  }
}

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AppApiConsumer<ProductDetailCubit, ProductModel?>(
        successBuilder: (context, state) {
          final product = state.data;
          if (product == null) {
            return const Center(child: LoadingWidget());
          }

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back button and title
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => context.pop(),
                          ),
                        ),
                        Text(
                          "Product Details",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Main image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product.thumbnail,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Product details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Product Details:',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            context.watch<FavoritesCubit>().isFavorite(product)
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            final favoritesCubit = context
                                .read<FavoritesCubit>();
                            if (favoritesCubit.isFavorite(product)) {
                              favoritesCubit.removeFavorite(product);
                            } else {
                              favoritesCubit.addFavorite(product);
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _detailRow('Name:', product.title),
                    const SizedBox(height: 8),
                    _detailRow('Price:', '\$${product.price}'),
                    const SizedBox(height: 8),
                    _detailRow('Category:', product.category),
                    const SizedBox(height: 8),
                    _detailRow('Brand:', product.brand ?? "N/A"),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        _detailRow('Rating:', product.rating.toString()),
                        const SizedBox(width: 4),
                        Row(
                          children: List.generate(
                            5,
                            (star) =>
                                Icon(Icons.star, color: Colors.amber, size: 16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _detailRow('Stock:', product.stock.toString()),
                    const SizedBox(height: 8),
                    Text(
                      'Description:',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      product.description,
                      style: GoogleFonts.montserrat(fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Product Gallery :',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Gallery grid
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: product.images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1.2,
                          ),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            product.images[index],
                            fit: BoxFit.fitHeight,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _detailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 6),
        Text(value, style: GoogleFonts.montserrat(fontSize: 14)),
      ],
    ),
  );
}
