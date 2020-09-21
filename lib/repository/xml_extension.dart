import 'package:xml/xml.dart';

extension IterableExtension on Iterable<XmlElement> {
  XmlElement firstOrDefault({XmlElement def}) {
    return isNotEmpty ? first : def;
  }
}
