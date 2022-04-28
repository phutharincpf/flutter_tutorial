import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos/constants/styles.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    Key? key,
    this.controller,
    this.initialValue,
    this.label,
    this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.enabled,
    this.validator,
    this.obscureText,
    this.decoration = const InputDecoration(),
    this.readOnly,
    this.onTap,
    this.focusNode,
    this.keyboardType,
    this.inputFormatters,
    this.borderWidth,
    this.enabledBorderColor,
    ValueChanged<String>? onFieldSubmitted,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? initialValue;
  final String? placeholder;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final InputDecoration? decoration;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onSubmitted;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final double? borderWidth;
  final Color? enabledBorderColor;

  void onChangedHandler(value) {
    if (onChanged != null) {
      onChanged!(value);
    }
  }

  void onFieldSubmittedHandler(value) {
    if (onSubmitted != null) {
      onSubmitted!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(label!, style: Styles.formTextStyleLabel)
            : Container(),
        // const SizedBox(height: 20),
        TextFormField(
          controller: controller,
          enabled: enabled ?? true,
          readOnly: readOnly ?? false,
          initialValue: initialValue,
          validator: validator,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: decoration?.copyWith(
            hintText: placeholder,
            fillColor: enabled == false ? Styles.formDisabledBg : Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: Styles.formPaddingHorizontal,
              vertical: Styles.formPadding,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? Styles.formBorderWidth,
              ),
              borderRadius: BorderRadius.circular(Styles.formBorderRadius),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? Styles.formBorderWidth,
                color: enabledBorderColor ?? Styles.formBorderColor,
              ),
              borderRadius: BorderRadius.circular(Styles.formBorderRadius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? Styles.formBorderWidth,
                color: Styles.formFocusedBorderColor,
              ),
              borderRadius: BorderRadius.circular(Styles.formBorderRadius),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? Styles.formBorderWidth,
                color: Styles.formDisabledBorderColor,
              ),
              borderRadius: BorderRadius.circular(Styles.formBorderRadius),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: borderWidth ?? Styles.formBorderWidth,
                color: Styles.formBorderErrorColor,
              ),
              borderRadius: BorderRadius.circular(Styles.formBorderRadius),
            ),
            errorStyle: Styles.formTextStyleInputError,
          ),
          style: Styles.formTextStyleInput.copyWith(
            color:
                enabled == false ? Styles.formDisabledColor : Styles.formColor,
          ),
          onChanged: onChangedHandler,
          onFieldSubmitted: onFieldSubmittedHandler,
          onTap: onTap,
          focusNode: focusNode,
        )
      ],
    );
  }
}
