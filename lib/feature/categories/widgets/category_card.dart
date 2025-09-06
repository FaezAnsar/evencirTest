import 'package:evencir_test/configs/routing/routes.dart';
import 'package:evencir_test/core/api/models/api_base_paginated_model.dart';
import 'package:evencir_test/core/widgets/app_api_consumer.dart';
import 'package:evencir_test/core/widgets/loading_widget.dart';
import 'package:evencir_test/feature/categories/cubit/products_by_category_cubit.dart';
import 'package:evencir_test/feature/categories/models/category_model.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.products.path, extra: category.url),
      child: BlocProvider(
        create: (context) =>
            ProductsByCategoryCubit()
              ..fetchProductsByCategory(category.url, limit: 1),
        child:
            AppApiConsumer<
              ProductsByCategoryCubit,
              ApiBasePaginatedModel<ProductModel>
            >(
              loadingBuilder: (context, state) => LoadingWidget(),
              emptyBuilder: (context, state) => Text('No products found'),
              successBuilder: (context, state) {
                category.thumbnail ??= state.data.data.isNotEmpty
                    ? state.data.data.first.thumbnail
                    : null;
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: (category.thumbnail != null)
                          ? Image.network(
                              category.thumbnail!,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
                          : LoadingWidget(),
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black.withValues(alpha: .25),
                      ),
                    ),
                    Positioned(
                      left: 5.sp,
                      right: 5.sp,
                      bottom: 10.sp,
                      child: SizedBox(
                        width: double.infinity,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            category.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.h,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withValues(alpha: 0.5),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
      ),
    );
  }
}
