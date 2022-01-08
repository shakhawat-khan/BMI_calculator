import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'reuseable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'result_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';





void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: kActiveCardColour,
        scaffoldBackgroundColor: kActiveCardColour,
      ),
      home: InputPage(),
    );
  }
}

enum Gender  {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

   Gender selectedGender = Gender.male;
   int height = 180;
   int weight = 60;
   int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor:kActiveCardColour ,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget> [
                  Expanded(child:GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: reuseableCard(

                      color: selectedGender == Gender.male ? box : KInactiveCardColour ,
                      cardChild: cardContent(icon: FontAwesomeIcons.mars,label: "MALE",) ,


                    ),
                  )
                  ),

                  Expanded(child: GestureDetector(

                    onTap: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },

                    child: reuseableCard(

                        color: selectedGender==Gender.female ? box:KInactiveCardColour,
                        cardChild:cardContent(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",),

                    ),
                  )

                  )

                ],
              )
          ),

          Expanded(
              child: reuseableCard(color: box,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',style: KlabelTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,

                      children: <Widget> [
                        Text(height.toString(),
                        style:KlabelNumberStyle,
                        ),
                        Text('cm',style: KlabelTextStyle,)
                      ],
                    ),

                      SliderTheme(

                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xFFEB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                        
                      ),
                      child: Slider(value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                           onChanged:(double newValue){
                              setState(() {
                                height = newValue.round();
                              });
                           }
                      ),
                    )

                  ],
                )
                 )
          ),
          Expanded(
              child: Row(
                children:<Widget> [
                 Expanded(child: reuseableCard(color: box, cardChild: 
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children:<Widget> [
                         Text(
                           'WEIGHT',
                           style: KlabelTextStyle,
                         ),
                         Text(
                           weight.toString(),
                           style: KlabelNumberStyle,
                         ),
                         
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children:<Widget> [
                             RoundIconButton(icon: FontAwesomeIcons.plus,
                               onPressed: (){
                               setState(() {
                                 weight++;

                               });
                               }),
                             SizedBox(width: 10,),
                             RoundIconButton(icon: FontAwesomeIcons.minus,
                                 onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                 }

                             ),
                           ],
                         )

                         
                       ],
                     )
                     )
                 ),
                  Expanded(child: reuseableCard(color: box,
                      cardChild:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:<Widget> [
                              Text('AGE',style: KlabelTextStyle,),
                              Text(age.toString(),style: KlabelNumberStyle,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:<Widget> [
                                   RoundIconButton(icon: FontAwesomeIcons.plus,
                                       onPressed:(){
                                          setState(() {
                                            age++;
                                          });
                                       }
                                   ),
                                  SizedBox(width: 10,),
                                  RoundIconButton(icon: FontAwesomeIcons.minus,
                                      onPressed: (){
                                        setState(() {
                                          age--;
                                        });
                                      }
                                      )
                                ],
                              )

                            ],
                          )
                        ],

                      )
                  ),
                      )


                ],
              )
          ),
          BottomButton(text: "CALCULATE",
            onTap:(){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);


            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              bmiResult:calc.calculateBMI() ,
              resultText:calc.getResult() ,
              interpretion: calc.getInterpretation(),
            )));

            //print(height);
          }
          ),


        ],
      )


    );
  }
}



class cardContent extends StatelessWidget {
  final IconData icon ;
  final String label;

  cardContent({required this.icon,required this.label});


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  <Widget>[
        Icon(
          icon,
          size: 80,

        ),
        SizedBox(height: 15.0,),
        Text(label,style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF808E98),
        ),
        )

      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  RoundIconButton({Key? key, required this.icon,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: (){
        onPressed();
      },
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape:CircleBorder() ,
      fillColor: Color(0xFF4C4F5E),

        );
  }
}




