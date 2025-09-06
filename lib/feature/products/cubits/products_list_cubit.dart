import 'dart:developer';

import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/api/api_cubit.dart';
import 'package:evencir_test/core/api/api_state.dart';
import 'package:evencir_test/core/api/models/api_base_paginated_model.dart';
import 'package:evencir_test/core/data_source/app_remote_data_source.dart';
import 'package:evencir_test/core/utils/helpers.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';

class ProductsListCubit
    extends AppApiCubit<ApiBasePaginatedModel<ProductModel>> {
  final AppRemoteDataSource appRemoteDatasource = locator();

  Future<void> fetchProducts({
    String? categoryUrl,
    int skip = 0,
    int limit = 10,
  }) async {
    await call(
      () => appRemoteDatasource.getProducts(
        limit: limit,
        skip: skip,
        categoryUrl: categoryUrl,
      ),
      onSuccess: () {
        log('Products loaded: ${products.length}');
      },
      onError: () {
        if (state is ApiErrorState) {
          displayToastMessage((state as ApiErrorState).error);
        }
      },
    );
  }

  List<ProductModel> get products {
    if (state is ApiLoadedState<ApiBasePaginatedModel<ProductModel>>) {
      return (state as ApiLoadedState<ApiBasePaginatedModel<ProductModel>>)
          .data
          .data;
    }
    return [];
  }
}
