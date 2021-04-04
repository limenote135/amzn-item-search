import 'package:flutter/material.dart';

class SliderTile extends StatefulWidget {
  const SliderTile({
    required this.title,
    required this.initValue,
    this.min = 0,
    required this.max,
    required this.divisions,
    this.onSubmit,
  });

  final String title;
  final double initValue;
  final double min;
  final double max;
  final int divisions;
  final void Function(double)? onSubmit;

  @override
  _SliderTileState createState() => _SliderTileState(initValue);
}

class _SliderTileState extends State<SliderTile> {
  _SliderTileState(this._value);

  double _value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.title}: $_value"),
          Slider.adaptive(
            value: _value,
            min: widget.min,
            max: widget.max,
            divisions: widget.divisions,
            onChanged: (value) {
              setState(() {
                _value = (value * 10).round() / 10;
              });
            },
            onChangeEnd: (value) {
              widget.onSubmit?.call((value * 10).round() / 10);
            },
          )
        ],
      ),
    );
  }
}
