import 'package:evencir_test/core/api/models/deserializable.dart';

class ApiBasePaginatedModel<T extends Deserializable>
    implements Deserializable {
  ApiBasePaginatedModel({
    required this.data,
    required this.total,
    this.skip,
    this.limit,
  });

  factory ApiBasePaginatedModel.fromJson(
    dynamic json, {
    required T Function(dynamic data) dataParser,
  }) {
    if (json is List) {
      return ApiBasePaginatedModel<T>(
        data: json.map((item) => dataParser(item)).toList(),
        total: json.length,
        skip: 0,
        limit: json.length,
      );
    } else if (json is Map<String, dynamic>) {
      return ApiBasePaginatedModel<T>(
        data:
            (json['products'] as List?)
                ?.map((item) => dataParser(item))
                .toList() ??
            [],
        total: json['total'] as int? ?? 0,
        skip: json['skip'] as int? ?? 0,
        limit: json['limit'] as int? ?? 0,
      );
    } else {
      return ApiBasePaginatedModel<T>(data: [], total: 0, skip: 0, limit: 0);
    }
  }

  List<T> data;
  int total;
  int? skip;
  int? limit;

  @override
  String toString() => toJson().toString();

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'skip': skip,
      'limit': limit,
      'data': data.map((v) => v.toString()).toList(),
    };
  }
}
