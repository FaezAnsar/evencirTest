import 'package:evencir_test/core/widgets/app_api_consumer.dart';
import 'package:evencir_test/core/widgets/loading_widget.dart';
import 'package:evencir_test/feature/favorites/favorites_cubit.dart';
import 'package:evencir_test/feature/products/cubits/product_detail_cubit.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                  vertical: 8.h,
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
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    // Main image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product.thumbnail,
                        height: 180.h,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Product details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            'Product Details:',
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.w,
                            ),
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
                        Text(
                          'Rating:',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.w,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          product.rating.toString(),
                          style: GoogleFonts.montserrat(fontSize: 14.h),
                        ),
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
                        fontSize: 14.h,
                      ),
                    ),
                    Text(
                      product.description,
                      style: GoogleFonts.montserrat(fontSize: 13),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Product Gallery :',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.h,
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
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          label,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 14.w,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            value,
            style: GoogleFonts.montserrat(fontSize: 14.w),
          ),
        ),
      ],
    ),
  );
}
