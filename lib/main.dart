import 'package:cubit_state/ingredients.dart';
import 'package:cubit_state/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  setUpServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cubit State',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Cubit State'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _coolFoods = [
    "Ugali",
    "Rice",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: _coolFoods.length,
              itemBuilder: (context, index) => ListTile(
                key: Key("${_coolFoods[index]}"),
                title: Text(_coolFoods[index]),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Ingredients(
                      food: _coolFoods[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
