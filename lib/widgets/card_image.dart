import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Material(
      color: Colors.white,
      elevation: 14,
      borderRadius: BorderRadius.circular(24),
      shadowColor: Colors.black,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 220,
            width: 300,
            child: Expanded(
                child: Image.asset(
              "images/logo_carajas.png",
            )),
          ),
        ),
      ),
    );
  }
}
