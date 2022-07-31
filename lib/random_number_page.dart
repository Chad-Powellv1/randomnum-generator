import 'dart:math';
import 'package:flutter/material.dart';

class RandomNumPage extends StatefulWidget {
  final int min, max;

  const RandomNumPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  State<RandomNumPage> createState() => _RandomNumPageState();
}

class _RandomNumPageState extends State<RandomNumPage> {
  int? _randomNum;
  final randomNum = Random();

  @override
  Widget build(BuildContext context) {
    widget.min;
    widget.max;
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number'),
      ),
      body: Center(
          child: Text(
        _randomNum?.toString() ?? 'Generate number',
        style: TextStyle(fontSize: 42),
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          setState(() {
            _randomNum =
                widget.min + randomNum.nextInt(widget.max + 1 - widget.min);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
