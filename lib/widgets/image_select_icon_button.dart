import 'package:amasearch/util/util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImageSelectIconButton extends StatelessWidget {
  const ImageSelectIconButton({
    super.key,
    required this.onSelect,
    required this.size,
  });

  final void Function(FilePickerResult result) onSelect;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () async {
          final result = await FilePicker.platform.pickFiles(
            type: FileType.image,
            allowMultiple: true,
          );
          if (result == null) {
            return;
          }
          onSelect(result);
        },
        child: Container(
          color: isDark(context) ? Colors.white24 : Colors.black26,
          width: size,
          height: size,
          child: const Icon(Icons.image),
        ),
      ),
    );
  }
}
