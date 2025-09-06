import 'package:evencir_test/feature/products/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<List<ProductModel>> {
  FavoritesCubit() : super([]);

  void addFavorite(ProductModel product) {
    if (!state.any((p) => p.id == product.id)) {
      emit([...state, product]);
    }
  }

  void removeFavorite(ProductModel product) {
    emit(state.where((p) => p.id != product.id).toList());
  }

  bool isFavorite(ProductModel product) {
    return state.any((p) => p.id == product.id);
  }
}
