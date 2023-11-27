import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  const CTextField({
    Key? key,
    this.visible = true,
    this.required = true,
    this.readOnly = false,
    this.obscureText = false,
    required this.labelText,
    required this.controller,
  }) : super(key: key);

  final bool visible;
  final String labelText;
  final bool required;
  final bool readOnly;
  final bool obscureText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText.isNotEmpty)
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style.copyWith(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                children: [
                  TextSpan(text: labelText),
                  if (required)
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 2),
          TextField(
            readOnly: readOnly,
            controller: controller,
            obscureText: obscureText,
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
