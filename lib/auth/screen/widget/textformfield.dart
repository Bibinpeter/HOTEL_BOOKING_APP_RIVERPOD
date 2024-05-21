import 'package:flutter/material.dart';

class TextFormFieldWidgetadmin extends StatelessWidget {
   
 
    TextFormFieldWidgetadmin({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    required this.errorText,
    
     required  this. validator,
    this.suffixIcon,
    this.obscureText,  
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final String errorText;
  final IconData? suffixIcon;
  final bool? obscureText;
  final Function validator;
  final Function onChanged;
   
  

  @override
Widget build(BuildContext context) {
  return TextFormField(
    controller: controller,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    decoration: InputDecoration(
      labelText: hintText,  
      prefixIcon: Icon(prefixIcon, color: Colors.white),  
      labelStyle: const TextStyle(color: Colors.white),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 254, 254, 254)),
      ),
      errorStyle: const TextStyle(color: Color.fromARGB(255, 253, 2, 2)),
    ),
    onChanged: onChanged as void Function(String)?, // Cast onChanged to proper type
    validator: (value) {
      final error = validator(value);
      if (error != null) return error;
      return null;
    },
    style: const TextStyle(color: Colors.white),
    obscureText: obscureText ?? false, // Added default value for obscureText
  );
}

}
