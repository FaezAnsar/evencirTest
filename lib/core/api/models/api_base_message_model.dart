import 'package:evencir_test/core/api/models/deserializable.dart';
import 'package:evencir_test/core/api/models/serializable.dart';
import 'package:evencir_test/core/utils/helpers.dart';

class NoData {}

// This model is used for all messages param in API responses
class ApiMessageModel<T> implements Deserializable, Serializable {
  ApiMessageModel({required this.message, this.data});

  ApiMessageModel.fromJson(Map<String, dynamic> json, {T Function()? parser})
    : this(
        message: json['message'] as String?,
        data: !isType<T, NoData>()
            ? parser != null
                  ? parser()
                  : json['data'] as T?
            : null,
      );

  @override
  Map<String, dynamic> toJson() => {'message': message, 'data': data};

  final String? message;
  final T? data;
}
