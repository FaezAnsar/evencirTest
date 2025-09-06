class ApiEndpoints {
  static const String baseUrl = 'https://dummyjson.com/products';
  static const String productCategoriesUrl = '$baseUrl/categories';

  static String productDetail(String id) => '$baseUrl/$id';
}
