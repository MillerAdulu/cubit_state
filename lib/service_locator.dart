import 'package:get_it/get_it.dart';
import 'package:cubit_state/cubit/get_ingredients_cubit.dart';

GetIt locator = GetIt.instance;

void setUpServiceLocator() {
  // TODO: Get it to work as intended
  // I have to enable this
  // locator.allowReassignment = true;
  locator.registerLazySingleton<GetIngredientsCubit>(
    () => GetIngredientsCubit(),
  );
}
