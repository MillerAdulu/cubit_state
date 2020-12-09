import 'package:cubit_state/cubit/get_ingredients_cubit.dart';
import 'package:cubit_state/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Ingredients extends StatefulWidget {
  Ingredients({Key key, @required this.food}) : super(key: key);

  final String food;

  @override
  _IngredientsState createState() => _IngredientsState();
}

class _IngredientsState extends State<Ingredients> {
  @override
  void initState() {
    super.initState();

    locator<GetIngredientsCubit>().fetchFoodIngredients(name: widget.food);
  }

  @override
  void dispose() {
    // TODO: Get it to work as intended
    // To get it to work as expected, I have to call this as I dispose the screen to reinitialize
    // setUpServiceLocator();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => locator<GetIngredientsCubit>(),
          child: BlocBuilder<GetIngredientsCubit, GetIngredientsState>(
            builder: (context, state) {
              return state.when(
                initial: () => Center(child: Text("Please wait")),
                loading: () => Center(child: Text("Loading")),
                loaded: (List<String> ingredients) => ListView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ingredients.length,
                  itemBuilder: (context, index) => ListTile(
                    key: Key("${ingredients[index]}"),
                    title: Text(ingredients[index]),
                  ),
                ),
                error: (err) => Center(child: Text("Error: ")),
              );
            },
          ),
        ),
      ),
    );
  }
}
