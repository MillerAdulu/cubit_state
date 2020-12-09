import 'package:get_it/get_it.dart';
import 'package:cubit_state/cubit/get_ingredients_cubit.dart';

GetIt locator = GetIt.instance;

void setUpServiceLocator() {
  locator.registerLazySingleton<GetIngredientsCubit>(
    () => GetIngredientsCubit(),
  );
}
