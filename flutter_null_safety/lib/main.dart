import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // In this tutorial I just write what I understand about null safety on dart/flutter till aug 12, 2021

  // There can be two types of variable declarations
  // 1. Can be null
  int? usersFavoriteNumber;
  // Here usersFavoriteNumber can be null.

  // 2. Can't be null
  int userAge = 0;
  // Here userAge can't be null.

  String? iCanHoldNull;
  String iCantHoldNull = 'I am not null';

  // 3. Here iCantHoldNull can be use for any place. Null-able or Non-Null-able area
  // 4. But iCanHoldNull can only be use where they except only Null-able value

  // 4.1
  void plusTen(String s) {
    var result = s + "+ 10";

    print(result);
  }

  int _counter = 0;

  void _incrementCounter() {
    iCanHoldNull = 'Some Value';

    // 4.2
    plusTen(iCantHoldNull);
    // 4.3
    // plusTen(iCanHoldNull); [This is ellegal. Because we are only excepting non-null-able value]

    // 5. What if we need to iCanHoldNull anywhere?

    // 5.1 We check it's null or not then we will use it if not null
    if (iCanHoldNull != null) {
      //plusTen(iCanHoldNull);    [I don't know why it's not working ;(]
    }

    // 5.2 Or we can asign any other value if this is null
    plusTen(iCanHoldNull ?? 'Other Value');

    // 5.3 We can forcibly [It's can be failed. Only use this when you are sure it's not null]
    plusTen(iCanHoldNull!);

    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
