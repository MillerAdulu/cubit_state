import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_ingredients_cubit.freezed.dart';

@freezed
abstract class GetIngredientsState with _$GetIngredientsState {
  const factory GetIngredientsState.initial() = _Initial;
  const factory GetIngredientsState.loading() = _Loading;
  const factory GetIngredientsState.loaded(List<String> ingredients) = _Loaded;
  const factory GetIngredientsState.error(String message) = _Error;
}

class GetIngredientsCubit extends Cubit<GetIngredientsState> {
  GetIngredientsCubit() : super(GetIngredientsState.initial());

  Future<void> fetchFoodIngredients({
    @required String name,
  }) async {
    try {
      emit(GetIngredientsState.loading());

      await Future.delayed(Duration(seconds: 3));

      emit(GetIngredientsState.loaded(getIngredients(name)));
    } catch (e) {
      emit(GetIngredientsState.error(e.toString()));
    }
  }
}

List<String> getIngredients(String name) {
  Map<String, List<String>> _ingredients = {
    'Ugali': ['Water', 'Maize Flour'],
    'Rice': ['Water', 'Rice'],
  };


  return _ingredients.values.toList()[_ingredients.keys.toList().indexOf(name)];
}
