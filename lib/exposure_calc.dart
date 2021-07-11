import 'package:flutter/material.dart';
import 'package:ndfiltercalc/widgets/chip_widget.dart';
import 'package:ndfiltercalc/widgets/nd_dropdown.dart';

class ExposureCalcWidget extends StatefulWidget {
  @override
  _ExposureCalcWidgetState createState() => _ExposureCalcWidgetState();
}

class _ExposureCalcWidgetState extends State<ExposureCalcWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [ChipWidget(), NDDropdownWidget()],
      ),
    );
  }
}
