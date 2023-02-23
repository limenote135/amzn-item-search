import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class AspectRatioItem {
  AspectRatioItem({this.value, this.text});
  final String? text;
  final double? value;
}

class AspectRatioWidget extends StatelessWidget {
  const AspectRatioWidget({
    super.key,
    this.aspectRatioS,
    this.aspectRatio,
    this.isSelected = false,
  });
  final String? aspectRatioS;
  final double? aspectRatio;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: AspectRatioPainter(
        aspectRatio: aspectRatio,
        aspectRatioS: aspectRatioS,
        isSelected: isSelected,
      ),
    );
  }
}

class AspectRatioPainter extends CustomPainter {
  AspectRatioPainter({
    this.aspectRatioS,
    this.aspectRatio,
    this.isSelected = false,
  });
  final String? aspectRatioS;
  final double? aspectRatio;
  final bool isSelected;
  @override
  void paint(Canvas canvas, Size size) {
    final Color color = isSelected ? Colors.blue : Colors.grey;
    final rect = Offset.zero & size;
    //https://github.com/flutter/flutter/issues/49328
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final aspectRatioResult =
        (aspectRatio != null && aspectRatio! > 0.0) ? aspectRatio! : 1.0;
    canvas.drawRect(
      getDestinationRect(
        rect: const EdgeInsets.all(10).deflateRect(rect),
        inputSize: Size(aspectRatioResult * 100, 100),
        fit: BoxFit.contain,
      ),
      paint,
    );

    final textPainter = TextPainter(
      text: TextSpan(
        text: aspectRatioS,
        style: TextStyle(
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
          fontSize: 16,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: rect.width);
    textPainter.paint(
      canvas,
      rect.center - Offset(textPainter.width / 2.0, textPainter.height / 2.0),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate is AspectRatioPainter &&
        (oldDelegate.isSelected != isSelected ||
            oldDelegate.aspectRatioS != aspectRatioS ||
            oldDelegate.aspectRatio != aspectRatio);
  }
}
