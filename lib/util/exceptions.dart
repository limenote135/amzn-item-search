// 日本では表示できず、NotFound や InvalidInput となる商品が発生した場合の例外
class AmazonItemNotFoundException implements Exception {
  const AmazonItemNotFoundException(this.message);
  final String message;

  @override
  String toString() => message;
}
