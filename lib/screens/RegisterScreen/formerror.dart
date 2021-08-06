import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, top: 10),
          child: Text(
            error,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
