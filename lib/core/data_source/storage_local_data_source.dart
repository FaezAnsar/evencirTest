//
import 'dart:convert';

import 'package:evencir_test/core/models/user_model.dart';
import 'package:evencir_test/core/utils/sharedpreference_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageLocalDataSource {
  StorageLocalDataSource(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  SharedPreferenceHandler<String?> get userToken =>
      SharedPreferenceHandler<String?>(
        sharedPreferences: sharedPreferences,
        key: 'user_token',
        defaultValue: null,
      );

  SharedPreferenceHandler<UserModel?> get user =>
      SharedPreferenceHandler<UserModel?>(
        sharedPreferences: sharedPreferences,
        key: 'user',
        defaultValue: null,
        serializer: (user) => jsonEncode(user?.toJson()),
        deserializer: (json) {
          if (json != null) {
            final userData = jsonDecode(json);
            if (userData is Map<String, dynamic>) {
              return UserModel.fromJson(userData);
            }
          }
          return null;
        },
      );

  SharedPreferenceHandler<bool?> get isFirstTime =>
      SharedPreferenceHandler<bool?>(
        sharedPreferences: sharedPreferences,
        key: 'is_first_time',
        defaultValue: true,
      );
}
