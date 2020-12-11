import 'package:flutter/material.dart';
import 'package:geo_wild_design/constants.dart';

class MyCustomBottomBar extends StatefulWidget {
  List<String> children;
  int currentSelected;
  final Function notifyParent;

  MyCustomBottomBar({
    @required this.children,
    @required this.notifyParent,
    this.currentSelected = 0,
  });

  @override
  _MyCustomBottomBarState createState() => _MyCustomBottomBarState();
}

class _MyCustomBottomBarState extends State<MyCustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    print("bottombar");
    int _currentSelected = widget.currentSelected;
    return Container(
      color: Colors.black,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(widget.children.length, (index) {
          if (index == _currentSelected) {
            return BottomItem(
              label: widget.children[index],
              selected: true,
              onTap: () {
                widget.notifyParent(index);
              },
            );
          } else {
            return BottomItem(
              label: widget.children[index],
              selected: false,
              onTap: () {
                widget.notifyParent(index);
              },
            );
          }
        }).toList(),
      ),
    );
  }
}

class BottomItem extends StatelessWidget {
  String label;
  bool selected = false;
  final Function onTap;

  BottomItem({
    @required this.label,
    @required this.onTap,
    this.selected,
  });

  @override
  Widget build(BuildContext context) {
    print("item");
    return Material(
      elevation: 10.0,
      color: Colors.black,
      child: InkResponse(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 20.0,
                  color: selected ? kPrimary_color : Colors.grey[200],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: selected ? 5 : 0,
                width: selected ? 30 : 0,
                color: selected ? kPrimary_color : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
