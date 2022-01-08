import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class reuseableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;


  reuseableCard({required this.color, required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: cardChild,
      margin: EdgeInsets.all(15.0),

      decoration: BoxDecoration(
        color:color,

        borderRadius: BorderRadius.circular(10),
      ),

    );
  }
}