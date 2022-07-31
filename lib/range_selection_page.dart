import 'package:flutter/material.dart';
import 'package:randomnum_generator/random_number_page.dart';
import 'package:randomnum_generator/range_selection_form.dart';

class RangeSelectionPage extends StatefulWidget {
  const RangeSelectionPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectionPage> createState() => _RangeSelectionPageState();
}

class _RangeSelectionPageState extends State<RangeSelectionPage> {
  final formKey = GlobalKey<FormState>();
  int _min = 0;
  int _max = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Range'),
      ),
      body: RangeSelectionForm(
        formKey: formKey,
        minValueSetter: (value) => _min = value,
        maxValueSetter: (value) => _max = value,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RandomNumPage(
                    min: _min,
                    max: _max,
                  ),
                ),
              );
            }
          }),
    );
  }
}
