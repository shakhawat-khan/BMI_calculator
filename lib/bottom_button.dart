import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  final String text;
  final Function onTap;

  BottomButton ({required this.text,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        child: Text(text,style: TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
        color: KBottomContainerColour ,
        margin: EdgeInsets.only(top: 10.0),
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}