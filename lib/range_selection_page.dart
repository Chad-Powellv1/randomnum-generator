import 'package:flutter/material.dart';

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
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            RangeSelectorTextFormField(
              labelText: 'Minimum',
              intValueSetter: (value) => _min = value,
            ),
            SizedBox(height: 25),
            RangeSelectorTextFormField(
              labelText: 'Maximum',
              intValueSetter: (value) => _max = value,
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();
              // TODO: Navigate to the generator page
            }
          }),
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
  final void Function(int value) intValueSetter;
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
