final _emailRegExp = RegExp(r'.+@.+\..+');

String? emailValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'メールアドレスが必要です';
  }
  if (!_emailRegExp.hasMatch(value)) {
    return "メールアドレスが不正です";
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "パスワードが必要です";
  }
  if (value.length < 8) {
    return "パスワードが短すぎます";
  }
  return null;
}

String? notEmptyValidator(String? value) {
  if (value == null || value.isEmpty) {
    return "入力してください";
  }
  return null;
}
