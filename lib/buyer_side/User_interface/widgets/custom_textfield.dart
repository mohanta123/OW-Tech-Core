import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData? icon;
  final String hint;
  final TextEditingController controller;
  final bool passType;
  final String? value;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.icon,
    required this.hint,
    this.value,
    this.passType = false,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscure = true;

  @override
  void initState() {
    if (widget.value != null) {
      widget.controller.text = widget.value ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        obscureText: widget.passType && _isObscure,
        controller: widget.controller,
        validator: (value) => widget.validator!(value),
        decoration: InputDecoration(
          border: InputBorder.none, // Hide the underline
          prefixIcon: Icon(widget.icon),
          hintText: widget.hint,
          // Add suffix icon for password visibility toggle
          suffixIcon: widget.passType
              ? IconButton(
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
              });
            },
            icon: Icon(
              _isObscure ? Icons.visibility_off : Icons.visibility,
            ),
          )
              : null,
        ),
      ),
    );
  }
}
