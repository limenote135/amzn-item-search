import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

final uuidProvider = Provider((_) => Uuid());
