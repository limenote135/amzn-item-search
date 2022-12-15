import 'dart:math';

final _randomizer = Random();

String randomString(int length) {
  final randomStr = StringBuffer();

  for (var i = 0; i < length; i++) {
    final alphaNum = 65 + _randomizer.nextInt(26);

    // 小文字は +32
    randomStr.write(String.fromCharCode(alphaNum + 32));
  }

  return randomStr.toString();
}

int randomIntWithRange(int min, int max) {
  final value = _randomizer.nextInt(max - min);
  return value + min;
}

int randomIntWithDigit(int digit) {
  if (digit <= 0 || digit >= 10) {
    return -1;
  }

  final max = pow(10, digit).toInt();
  final min = digit == 1 ? 0 : max ~/ 10;
  final value = randomIntWithRange(min, max);

  return value;
}
