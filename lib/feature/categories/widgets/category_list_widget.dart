import 'package:evencir_test/core/widgets/keep_alive_wrapper_widget.dart';
import 'package:evencir_test/feature/categories/models/category_model.dart';
import 'package:evencir_test/feature/categories/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({super.key, required this.filteredCategories});

  final List<CategoryModel> filteredCategories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: filteredCategories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        final category = filteredCategories[index];

        return KeepAliveWrapper(child: CategoryCard(category: category));
      },
    );
  }
}
