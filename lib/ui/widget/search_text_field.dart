import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearcTextField extends StatelessWidget {
  const SearcTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 0,
      color: Color(0xFFEEEEEE),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: TextField(
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
            prefixIcon: IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
