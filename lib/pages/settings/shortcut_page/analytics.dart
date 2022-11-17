import 'package:amasearch/models/enums/shortcut_type.dart';
import 'package:amasearch/models/general_settings.dart';

String encodeShortcutToUserProp(List<ShortcutDetail> commands) {
  final buffer = StringBuffer("[");
  for (var i = 0; i < commands.length; i++) {
    if (commands[i].type != ShortcutType.none) {
      final val = _createShortcutPropVal(commands[i]);
      buffer
        ..write("(")
        ..write(val)
        ..write(")");
    }
  }
  buffer.write("]");
  return buffer.toString();
}

String _createShortcutPropVal(ShortcutDetail command) {
  switch (command.type) {
    case ShortcutType.none:
      // ここにはこないはず
      return "";
    case ShortcutType.purchase:
      return "buy";
    case ShortcutType.delete:
      return "del";
    case ShortcutType.web:
      return "web:${command.param}";
    case ShortcutType.navigation:
      switch (command.param) {
        case navigationTargetNewOffers:
          return "nav:new";
        case navigationTargetUsedOffers:
          return "nav:used";
        case navigationTargetKeepa:
          return "nav:kp";
        case navigationTargetVariation:
          return "nav:v";
      }
      return "nav:${command.param}";
  }
}
