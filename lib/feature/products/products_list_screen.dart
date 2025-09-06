import 'dart:developer';

import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/cubits/search_cubit.dart';
import 'package:evencir_test/core/widgets/app_api_paginated_consumer.dart';
import 'package:evencir_test/feature/products/cubits/products_list_cubit.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsListScreen extends StatelessWidget {
  final String? categoryUrl;
  final TextEditingController _searchController = TextEditingController();

  ProductsListScreen({super.key, this.categoryUrl});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<SearchCubit>()),
        BlocProvider(
          create: (context) =>
              locator<ProductsListCubit>()
                ..fetchProducts(categoryUrl: categoryUrl),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      if (categoryUrl != null)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => context.pop(),
                          ),
                        ),
                      Center(
                        child: Text(
                          categoryUrl?.split('/').last ?? "Products",
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 20.h,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      onChanged: (value) =>
                          context.read<SearchCubit>().setQuery(value),
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'iphone',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Expanded(
                    child: AppApiPaginatedConsumer<ProductsListCubit, ProductModel>(
                      onLoadMore: (context, skip) =>
                          fetchMoreProducts(context, skip: skip),
                      onRefresh: (context, skip) =>
                          fetchMoreProducts(context, skip: skip),
                      listener: (context, state, products) {},
                      emptyBuilder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.all(12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error,
                                size: 80,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'No Products Found',
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        );
                      },
                      itemsBuilder: (context, state, products) {
                        final query = context.watch<SearchCubit>().state;

                        final filteredProducts = products
                            .where(
                              (product) =>
                                  product.title.toLowerCase().contains(query) ||
                                  product.category.toLowerCase().contains(
                                    query,
                                  ),
                            )
                            .toList();
                        log('Products loaded: ${products.length}');
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                              child: Text(
                                '${filteredProducts.length} results found',
                                style: GoogleFonts.montserrat(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                itemCount: filteredProducts.length,
                                itemBuilder: (context, index) {
                                  final product = filteredProducts[index];
                                  return GestureDetector(
                                    onTap: () {
                                      context.push('/product/${product.id}');
                                    },
                                    child: Card(
                                      color: Theme.of(context).cardColor,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                        side: BorderSide(
                                          color: Colors.grey.shade200,
                                          width: 1,
                                        ),
                                      ),
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                ),
                                            child: Image.network(
                                              product.thumbnail,
                                              height: 180,
                                              width: double.infinity,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        product.title,
                                                        style:
                                                            GoogleFonts.montserrat(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.sp,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      "\$${product.price.toString()}",
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18.sp,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 4.h),
                                                Row(
                                                  children: [
                                                    Text(
                                                      product.rating.toString(),
                                                      style:
                                                          GoogleFonts.montserrat(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 14.sp,
                                                          ),
                                                    ),
                                                    SizedBox(width: 4.w),
                                                    Row(
                                                      children: List.generate(
                                                        5,
                                                        (star) => Icon(
                                                          Icons.star,
                                                          color: Colors.amber,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  'By ${product.brand ?? ""}',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                Text(
                                                  'In ${product.category}',
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14.sp,
                                                    color: Colors.grey[700],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void fetchMoreProducts(BuildContext context, {required int skip}) {
    context.read<ProductsListCubit>().fetchProducts(skip: skip);
  }
}
