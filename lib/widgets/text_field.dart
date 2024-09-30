
import 'package:flutter/material.dart';
import 'package:flutter_project/constants/colors.dart';

//text field widget
class buildTextField extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? margin;
  final bool obscureText;
  final bool isPassword;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final bool? enabled;
  final String? Function(String?)? validator;
  final int? maxLength;
  final int? maxLines;
  final bool? filled;
  final Color fillColor;
  final Color? enabledBorderColor;
  final Color? hintColor;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  
  const buildTextField({
    super.key,
    this.controller,
    this.contentPadding,
    this.margin,
    this.obscureText = false,
    this.isPassword = false,
    this.hintText,
    this.textAlign,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.onChanged,
    this.onSaved,
    this.enabled = true,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.filled = false,
    required this.fillColor,
    this.enabledBorderColor = lightBlue,
    this.hintColor = black3,
    this.focusNode,
    
  });
  @override
  _buildTextFieldState createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  @override
  void initState() {
    super.initState();
    setState(() {
      hidepassword = widget.obscureText;
    });
  }

  bool hidepassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          EdgeInsets.symmetric(vertical: 3),
      child: TextFormField(
      
        
        style: TextStyle(
          fontSize: 12,
        ),
        textAlign: widget.textAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        
        enabled: widget.enabled,
        maxLines: widget.maxLines ?? 1,
        controller: widget.controller,
        obscureText: hidepassword,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        focusNode: widget.focusNode,

        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          suffix: widget.suffixIcon,
          filled: widget.filled,
          fillColor: widget.fillColor,
          hintText: widget.hintText,
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          hintStyle: TextStyle(
            
            color: widget.hintColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: grey,
              width: 0.1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
                color: grey,
                width: 0.4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: black2,
              width: 0.1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                color: lightBlue,
                width: 0.1,
              )),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
