import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/api/api_cubit.dart';
import 'package:evencir_test/core/api/api_state.dart';
import 'package:evencir_test/core/api/models/api_base_paginated_model.dart';
import 'package:evencir_test/core/data_source/app_remote_data_source.dart';
import 'package:evencir_test/core/utils/helpers.dart';
import 'package:evencir_test/feature/categories/cubit/products_by_category_cubit.dart';
import 'package:evencir_test/feature/categories/models/category_model.dart';

class CategoriesCubit extends AppApiCubit<List<CategoryModel>> {
  final AppRemoteDataSource appRemoteDatasource = locator();
  final ProductsByCategoryCubit productsByCategoryCubit = locator();

  Future<void> fetchCategories() async {
    await call(
      () => appRemoteDatasource.getCategories(),
      onSuccess: () async {
        // for (final category in categories) {
        //   await productsByCategoryCubit.fetchProductsByCategory(
        //     category.url,
        //     limit: 1,
        //   );
        //   category.thumbnail = productsByCategoryCubit.products.isNotEmpty
        //       ? productsByCategoryCubit.products.first.thumbnail
        //       : null;
        // }
      },
      onError: () {
        if (state is ApiErrorState) {
          displayToastMessage((state as ApiErrorState).error);
        }
      },
    );
  }

  List<CategoryModel> get categories {
    if (state is ApiLoadedState<ApiBasePaginatedModel<CategoryModel>>) {
      return (state as ApiLoadedState<ApiBasePaginatedModel<CategoryModel>>)
          .data
          .data;
    }
    return [];
  }
}
