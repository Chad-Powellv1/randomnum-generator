import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectionForm extends StatelessWidget {
  const RangeSelectionForm({
    Key? key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RangeSelectorTextFormField(
            labelText: 'Minimum',
            intValueSetter: minValueSetter,
          ),
          SizedBox(height: 25),
          RangeSelectorTextFormField(
            labelText: 'Maximum',
            intValueSetter: maxValueSetter,
          ),
        ]),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      keyboardType: TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      validator: (value) {
        // Check if the value is a valid integer
        if (value == null || int.tryParse(value) == null) {
          return 'Please enter a valid number';
        } else {
          return null;
        }
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue ?? '')),
    );
  }
}
