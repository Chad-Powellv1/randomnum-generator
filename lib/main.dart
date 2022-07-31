import 'package:flutter/material.dart';
import 'package:randomnum_generator/range_selection_page.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Number Generator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RangeSelectionPage(),
    );
  }
}
