import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/cubits/search_cubit.dart';
import 'package:evencir_test/core/widgets/app_api_consumer.dart';
import 'package:evencir_test/feature/categories/cubit/categories_cubit.dart';
import 'package:evencir_test/feature/categories/models/category_model.dart';
import 'package:evencir_test/feature/categories/widgets/category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<SearchCubit>()),
        BlocProvider(
          create: (context) => locator<CategoriesCubit>()..fetchCategories(),
        ),
      ],

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Builder(
              builder: (context) {
                final categories = locator<CategoriesCubit>().categories;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        'Categories',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      child: TextField(
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
                    ),

                    const SizedBox(height: 8),
                    Expanded(
                      child:
                          AppApiConsumer<CategoriesCubit, List<CategoryModel>>(
                            successBuilder: (context, categories) {
                              final filteredCategories = categories.data
                                  .where(
                                    (category) =>
                                        category.name.toLowerCase().contains(
                                          context.watch<SearchCubit>().state,
                                        ),
                                  )
                                  .toList();
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${filteredCategories.length} results found',
                                    style: GoogleFonts.montserrat(
                                      color: Colors.grey,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  CategoryListWidget(
                                    filteredCategories: filteredCategories,
                                  ),
                                ],
                              );
                            },
                          ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
