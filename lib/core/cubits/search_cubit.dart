import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<String> {
  SearchCubit() : super('');

  void setQuery(String query) => emit(query.trim().toLowerCase());
}
