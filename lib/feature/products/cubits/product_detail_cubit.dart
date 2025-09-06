import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/api/api_cubit.dart';
import 'package:evencir_test/core/api/api_state.dart';
import 'package:evencir_test/core/data_source/app_remote_data_source.dart';
import 'package:evencir_test/core/utils/helpers.dart';
import 'package:evencir_test/feature/products/models/product_model.dart';

class ProductDetailCubit extends AppApiCubit<ProductModel> {
  final AppRemoteDataSource _appRemoteDataSource = locator();

  Future<void> getProductDetail({required String productId}) async {
    await call(
      () {
        return _appRemoteDataSource.getProductDetail(id: productId);
      },
      onSuccess: () {},
      onError: () {
        if (state is ApiErrorState) {
          displayToastMessage((state as ApiErrorState).error);
        }
      },
    );
  }

  ProductModel? get productDetail => state is ApiLoadedState
      ? (state as ApiLoadedState<ProductModel>).data
      : null;
}
