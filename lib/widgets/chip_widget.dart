import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  late GlobalKey<ScaffoldState> _key;
  late bool _isSelected;
  late List<NDFilter> _ndFilters;
  late List<String> _selections;
  late List<String> _choices;
  late int _choiceIndex;

  @override
  void initState() {
    super.initState();
    _key = GlobalKey<ScaffoldState>();
    _isSelected = false;
    _choiceIndex = 0;
    _selections = <String>[];
    _ndFilters = <NDFilter>[
      NDFilter('ND3', 3, 8.0),
      NDFilter('ND4', 4, 16),
      NDFilter('ND4', 1000, 16),
    ];
    _choices = ["Software Engineer", "Software Developer", "Software Testing"];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Wrap(
            children: filterPosition.toList(),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> get filterPosition sync* {
    for (NDFilter ndFilter in _ndFilters) {
      yield Padding(
        padding: const EdgeInsets.all(6.0),
        child: FilterChip(
          backgroundColor: Colors.amberAccent,
          avatar: CircleAvatar(
            backgroundColor: Colors.cyan,
            child: FittedBox(
              child: Text(
                ndFilter.displayValue.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          label: Text(
            ndFilter.name,
          ),
          selected: _selections.contains(ndFilter.name),
          selectedColor: Colors.amber,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selections.add(ndFilter.name);
              } else {
                _selections.removeWhere((String name) {
                  return name == ndFilter.name;
                });
              }
            });
          },
        ),
      );
    }
  }

  Widget _buildChip(String label, Color color) {
    return Chip(
      labelPadding: EdgeInsets.all(4.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: EdgeInsets.all(8.0),
    );
  }
}

class NDFilter {
  const NDFilter(this.name, this.displayValue, this.value);
  final int displayValue;
  final String name;
  final double value;
}
