import 'package:evencir_test/core/api/models/deserializable.dart';
import 'package:evencir_test/core/api/models/serializable.dart';

class UserModel implements Deserializable, Serializable {
  UserModel({this.id, this.name, this.email, this.avatarUrl, this.isActive});

  UserModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        avatarUrl: json['avatar_url'] as String?,
        isActive: json['is_active'] as bool?,
      );

  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'avatar_url': avatarUrl,
    'is_active': isActive,
  };

  final int? id;
  final String? name;
  final String? email;
  final String? avatarUrl;
  final bool? isActive;
}
