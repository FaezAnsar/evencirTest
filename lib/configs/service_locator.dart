import 'package:evencir_test/core/cubits/auth/auth_cubit.dart';
import 'package:evencir_test/core/cubits/search_cubit.dart';
import 'package:evencir_test/core/data_source/app_remote_data_source.dart';
import 'package:evencir_test/core/data_source/auth_remote_data_source.dart';
import 'package:evencir_test/core/data_source/storage_local_data_source.dart';
import 'package:evencir_test/feature/categories/cubit/categories_cubit.dart';
import 'package:evencir_test/feature/categories/cubit/products_by_category_cubit.dart';
import 'package:evencir_test/feature/favorites/favorites_cubit.dart';
import 'package:evencir_test/feature/products/cubits/products_list_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // Data sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(),
  );
  locator.registerLazySingleton<AppRemoteDataSource>(
    () => AppRemoteDataSource(),
  );
  locator.registerLazySingleton<StorageLocalDataSource>(
    () => StorageLocalDataSource(sharedPreferences),
  );

  // Services

  // Cubits/Blocs
  locator.registerLazySingleton<AuthCubit>(() => AuthCubit(locator()));
  locator.registerLazySingleton<CategoriesCubit>(() => CategoriesCubit());

  locator.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());

  locator.registerLazySingleton<ProductsByCategoryCubit>(
    () => ProductsByCategoryCubit(),
  );

  // i am doing this so each screen search bar is independent and queries are not mixed
  locator.registerFactory<SearchCubit>(() => SearchCubit());

  //so that products list and prodcucts by category cubit get different instance
  locator.registerFactory<ProductsListCubit>(() => ProductsListCubit());
}
