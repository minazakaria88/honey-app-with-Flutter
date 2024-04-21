import 'package:flutter/material.dart';

class NewTextFiled extends StatelessWidget {
  const NewTextFiled({
    super.key,
    required this.function,
    required this.iconData,
    required this.label, required this.controller,
  });
  final Function function;
  final IconData iconData;
  final String label;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          return function(value);
        },
        controller: controller,
        decoration: InputDecoration(
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.yellow,
              width: 2,
            ),
          ),
          prefixIcon: Icon(
            iconData,
            color: Colors.yellow,
          ),
          labelText: label,
        ),
      ),
    );
  }
}
