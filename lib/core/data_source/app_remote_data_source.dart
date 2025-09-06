import 'package:evencir_test/core/api/models/api_base_paginated_model.dart';
import 'package:evencir_test/core/constants/api_endpoints.dart';
import 'package:evencir_test/core/data_source/base_remote_data_source.dart';
import 'package:evencir_test/feature/categories/models/category_model.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';

class AppRemoteDataSource extends BaseRemoteDataSource {
  Future<BaseResponse<ApiBasePaginatedModel<ProductModel>>> getProducts({
    String? categoryUrl,
    required int limit,
    required int skip,
  }) {
    return request(
      useCache: true,
      endpoint: categoryUrl ?? ApiEndpoints.baseUrl,
      method: RequestType.get,
      param: {'limit': limit.toString(), 'skip': skip},
      transformer: (data) => ApiBasePaginatedModel<ProductModel>.fromJson(
        data as Map<String, dynamic>,
        dataParser: (data) =>
            ProductModel.fromJson(data as Map<String, dynamic>),
      ),
    );
  }

  Future<BaseResponse<ProductModel>> getProductDetail({required String id}) {
    return request(
      useCache: true,
      endpoint: ApiEndpoints.productDetail(id),
      method: RequestType.get,
      transformer: (data) =>
          ProductModel.fromJson(data as Map<String, dynamic>),
    );
  }

  Future<BaseResponse<List<CategoryModel>>> getCategories(
    //required int limit,
  ) {
    return request(
      endpoint: ApiEndpoints.productCategoriesUrl,
      method: RequestType.get,
      //param: {'limit': limit.toString()},
      transformer: (data) => (data as List)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  //   Future<BaseResponse<ApiBasePaginatedModel<ProductModel>>>
  //   getProductsByCategory(String url, int limit) {
  //     return request(
  //       endpoint: url,
  //       method: RequestType.get,
  //       param: (limit != null) ? {'limit': limit.toString()} : null,
  //       transformer: (data) => ApiBasePaginatedModel<ProductModel>.fromJson(
  //         data,
  //         dataParser: (data) =>
  //             ProductModel.fromJson(data as Map<String, dynamic>),
  //       ),
  //     );
  //   }
  // }
}
