import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/cubits/search_cubit.dart';
import 'package:evencir_test/feature/favorites/favorites_cubit.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';
import 'package:evencir_test/feature/products/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SearchCubit>(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Favourites',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) =>
                          context.read<SearchCubit>().setQuery(value),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Apple',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    BlocBuilder<FavoritesCubit, List<ProductModel>>(
                      builder: (context, favorites) {
                        return Text(
                          '${favorites.length} results found',
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: BlocBuilder<FavoritesCubit, List<ProductModel>>(
                        builder: (context, favorites) {
                          final query = context.watch<SearchCubit>().state;
                          final filteredFavorites = favorites.where((product) {
                            return product.title.toLowerCase().contains(
                                  query,
                                ) ||
                                (product.brand ?? '').toLowerCase().contains(
                                  query,
                                ) ||
                                product.category.toLowerCase().contains(query);
                          }).toList();
                          if (filteredFavorites.isEmpty) {
                            return Center(child: Text('No favourites yet.'));
                          }
                          return ListView.builder(
                            itemCount: filteredFavorites.length,
                            itemBuilder: (context, index) {
                              final product = filteredFavorites[index];
                              return Card(
                                color: Theme.of(context).cardColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  // side: index == 0
                                  //     ? BorderSide(color: Colors.blue, width: 2)
                                  //     : BorderSide.none,
                                ),
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      product.thumbnail,
                                      width: 56,
                                      height: 56,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    product.title,
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '\$${product.price}',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            product.rating.toString(),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 13,
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          Row(
                                            children: List.generate(
                                              5,
                                              (star) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FavoritesCubit>()
                                          .removeFavorite(product);
                                    },
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => ProductDetailScreen(
                                          productId: product.id.toString(),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
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
