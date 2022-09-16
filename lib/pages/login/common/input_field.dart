import 'package:amasearch/util/validators.dart';
import 'package:flutter/material.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField({
    super.key,
    this.fieldKey,
    this.autoFocus = false,
    this.onSubmit,
  });

  final Key? fieldKey;
  final bool autoFocus;
  final void Function(String?)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      autofocus: autoFocus,
      validator: emailValidator,
      decoration: InputDecoration(
        hintText: "メールアドレス",
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      onFieldSubmitted: onSubmit,
    );
  }
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    this.fieldKey,
    this.controller,
    this.focusNode,
    this.hintText,
    this.inputAction,
    this.validator,
    this.onSubmit,
  });

  final Key? fieldKey;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? hintText;
  final TextInputAction? inputAction;
  final String? Function(String?)? validator;
  final void Function(String?)? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: fieldKey,
      controller: controller,
      focusNode: focusNode,
      validator: validator ?? passwordValidator,
      decoration: InputDecoration(
        hintText: hintText ?? "パスワード",
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      obscureText: true,
      textInputAction: inputAction,
      onFieldSubmitted: onSubmit,
    );
  }
}
