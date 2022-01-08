import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/result_page.dart';
import 'reuseable_card.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretion;

  ResultPage({required this.bmiResult,required this.resultText,required this.interpretion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        backgroundColor: const Color( 0xFF1D1E33),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(

              child:Container(
                child: Text(
                  'Your Result',
                  style: KtitleTextStyle,
                ),
              )
          ),
          Expanded(
            flex: 5,
              child: reuseableCard(
                color: box,
                cardChild: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text(resultText,style: resultTextStyle,),
                    
                    Text(bmiResult,style:KBmiTextStyle ,),

                    Text(interpretion,style: KbodyTextStyle,textAlign: TextAlign.center,)

                  ],
                ),

              )
          ),

          BottomButton(text: "Re Calculate",
              onTap: (){
                Navigator.pop(context);
          })

        ],
      ),
    );
  }

}
