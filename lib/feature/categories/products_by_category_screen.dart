// import 'dart:developer';

// import 'package:evencir_test/core/widgets/app_api_paginated_consumer.dart';
// import 'package:evencir_test/feature/categories/cubit/products_by_category_cubit.dart';
// import 'package:evencir_test/feature/products/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ProductsByCategoryScreen extends StatelessWidget {
//   final String categoryUrl;
//   final TextEditingController _searchController = TextEditingController();
//   final ValueNotifier<int> _resultsCount = ValueNotifier<int>(0);

//   ProductsByCategoryScreen({super.key, required this.categoryUrl});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: BlocProvider(
//           create: (context) =>
//               ProductsByCategoryCubit()
//                 ..fetchProductsByCategory(categoryUrl, limit: 10),
//           child: Builder(
//             builder: (context) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 16),

//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: IconButton(
//                           icon: const Icon(Icons.arrow_back),
//                           onPressed: () => context.pop(),
//                         ),
//                       ),
//                       Text(
//                         categoryUrl.split('/').last,
//                         style: GoogleFonts.playfairDisplay(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search),
//                         hintText: 'iphone',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(
//                           vertical: 0,
//                           horizontal: 12,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: ValueListenableBuilder<int>(
//                       valueListenable: _resultsCount,
//                       builder: (context, count, _) {
//                         return Text(
//                           '$count results found',
//                           style: GoogleFonts.montserrat(
//                             fontSize: 12,
//                             color: Colors.grey,
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Expanded(
//                     child:
//                         AppApiPaginatedConsumer<
//                           ProductsByCategoryCubit,
//                           ProductModel
//                         >(
//                           key: GlobalKey<AppApiPaginatedConsumerState>(),
//                           onLoadMore: (context, skip) =>
//                               fetchMoreProducts(context, skip: skip),
//                           onRefresh: (context, skip) =>
//                               fetchMoreProducts(context, skip: skip),
//                           listener: (context, state, products) {
//                             _resultsCount.value = products.length;
//                           },
//                           emptyBuilder: (context, state) {
//                             return Padding(
//                               padding: EdgeInsets.all(12.w),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   const Icon(
//                                     Icons.error,
//                                     size: 80,
//                                     color: Colors.grey,
//                                   ),
//                                   const SizedBox(height: 16),
//                                   Text(
//                                     'No Products Found',
//                                     style: Theme.of(
//                                       context,
//                                     ).textTheme.titleLarge,
//                                     textAlign: TextAlign.center,
//                                   ),
//                                   const SizedBox(height: 24),
//                                 ],
//                               ),
//                             );
//                           },
//                           itemsBuilder: (context, state, products) {
//                             log('Products loaded: ${products.length}');
//                             return ListView.builder(
//                               shrinkWrap: true,
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 12,
//                               ),
//                               itemCount: products.length,
//                               itemBuilder: (context, index) {
//                                 final product = products[index];
//                                 return GestureDetector(
//                                   onTap: () {
//                                     context.push('/product/${product.id}');
//                                   },

//                                   child: Card(
//                                     color: Theme.of(context).cardColor,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     margin: const EdgeInsets.only(bottom: 16),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         ClipRRect(
//                                           borderRadius: BorderRadius.vertical(
//                                             top: Radius.circular(12),
//                                           ),
//                                           child: Image.network(
//                                             product.thumbnail,
//                                             height: 140,
//                                             width: double.infinity,
//                                             fit: BoxFit.fitHeight,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.all(12.0),
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Row(
//                                                 mainAxisAlignment:
//                                                     MainAxisAlignment
//                                                         .spaceBetween,
//                                                 children: [
//                                                   Expanded(
//                                                     child: Text(
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       product.title,
//                                                       style:
//                                                           GoogleFonts.montserrat(
//                                                             fontWeight:
//                                                                 FontWeight.bold,
//                                                             fontSize: 16,
//                                                           ),
//                                                     ),
//                                                   ),
//                                                   Text(
//                                                     "\$${product.price.toString()}",
//                                                     style:
//                                                         GoogleFonts.montserrat(
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           fontSize: 16,
//                                                         ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 4),
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     product.rating.toString(),
//                                                     style:
//                                                         GoogleFonts.montserrat(
//                                                           fontWeight:
//                                                               FontWeight.w500,
//                                                           fontSize: 12,
//                                                         ),
//                                                   ),
//                                                   const SizedBox(width: 4),
//                                                   Row(
//                                                     children: List.generate(
//                                                       5,
//                                                       (star) => Icon(
//                                                         Icons.star,
//                                                         color: Colors.amber,
//                                                         size: 14,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                               const SizedBox(height: 4),
//                                               Text(
//                                                 'By ${product.brand}',
//                                                 style: GoogleFonts.montserrat(
//                                                   fontSize: 12,
//                                                   color: Colors.grey[700],
//                                                 ),
//                                               ),
//                                               const SizedBox(height: 2),
//                                               Text(
//                                                 'In ${product.category}',
//                                                 style: GoogleFonts.montserrat(
//                                                   fontSize: 12,
//                                                   color: Colors.grey[700],
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                           },
//                         ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   void fetchMoreProducts(BuildContext context, {required int skip}) {
//     context.read<ProductsByCategoryCubit>().fetchProductsByCategory(
//       categoryUrl,
//       limit: 10,
//       skip: skip,
//     );
//   }
// }
