import 'package:flutter/material.dart';
import 'package:notes_test/utils/Themes.dart';
import 'package:sizer/sizer.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final ValueSetter<String>? onChangeText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Function? onSubmitted;
  final Function? onTap;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;

  final String? hintText;
  final String? labelText;
  final String? titleText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isInputPassword;
  final bool readOnly;

  final double? height;
  final double? width;
  final int? maxLines;
  final double borderRadius;
  final double textHintHieght;
  final TextAlign textAlign;

  TextFieldWidget(
      {this.onChangeText,
        this.hintText,
        this.maxLines=1,
        this.prefixIcon,
        this.suffixIcon,
        this.controller,
        this.textAlign = TextAlign.start,
        this.textInputAction,
        this.errorText,
        this.isInputPassword = false,
        this.focusNode,
        this.textInputType = TextInputType.text,
        this.onSubmitted,
        this.labelText,
        this.height,
        this.width,
        this.titleText,
        this.readOnly = false,
        this.onTap,
        this.borderRadius = 10,
        this.backgroundColor = const Color(0xffF7F7F9),
        this.boxShadow = const [], this.padding=const EdgeInsets.all(0), this.textHintHieght = 2});

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          boxShadow: widget.boxShadow,
          // border: Border.all(color: Colors.grey[200]!, width: 1),
          color: widget.backgroundColor),
      child: TextFormField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: (v) => widget.onSubmitted!(v),
        // onTap: () => widget.onTap!(),
        onChanged: (value) => widget.onChangeText!(value),
        obscureText: widget.isInputPassword,
        style: TextStyle(fontSize: 14.sp),
        textAlign: widget.textAlign,
        decoration: InputDecoration(
            prefixIcon: (widget.prefixIcon != null) ? widget.prefixIcon : null,
            suffixIcon: (widget.suffixIcon != null) ? widget.suffixIcon : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[400], height: widget.textHintHieght,),
            labelText: widget.labelText,
            labelStyle: TextStyle(color: Themes.primaryColor),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
            errorText: widget.errorText,
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2)),
            border: InputBorder.none,
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1)),
        ),
        keyboardType: widget.textInputType,
        readOnly: widget.readOnly,
      ),
    );
  }
}
