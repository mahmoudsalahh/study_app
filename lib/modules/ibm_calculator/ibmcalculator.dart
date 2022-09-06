import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salahh/modules/ibmresult_screen/reslultscreen.dart';

class IbmCalculator extends StatefulWidget {

  @override
  State<IbmCalculator> createState() => _IbmCalculatorState();
}

class _IbmCalculatorState extends State<IbmCalculator> {
bool isMale = true;
double height = 180.0;
int weight = 40 ;
int age = 20 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('IBM CALCULATOR' , style : TextStyle(fontSize: 25.0)),
              ],
            ),
          ),),
      body:
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = true ;
                        });

                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                           color: isMale ?  Colors.tealAccent  :   Colors.teal,

                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            CircleAvatar(
                              radius: 40.0,
                              backgroundImage: AssetImage('images/img.jpg'),
                            ),
                            Text('MALE' , style : TextStyle(fontSize: 40.0)),
                          ],),
                        ),
                    ),
                    ),

                  SizedBox(width: 20.0,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale = false ;

                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: !isMale ?  Colors.tealAccent  :   Colors.teal,
                        ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                            Icon(Icons.female , color: Colors.white, size: 70.0 ,) ,
                            Text('FEMALE' , style : TextStyle(fontSize: 40.0)),
                          ],),
                        ),
                    ),
                    ),


                ],
              ),




            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.teal,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT' , style:  TextStyle(fontSize: 25.0 , color: Colors.white)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${height.round()}' , style:  TextStyle(fontSize: 35.0 , color: Colors.white)),
                        SizedBox(width: 5.0,),
                        Text('CM' , style:  TextStyle(fontSize: 15.0 , color: Colors.white)),

                      ],

                    ),
                    Slider(
                      activeColor: Colors.white,
                        value: height,
                        max: 225.0,
                        min:80.0,
                        onChanged: (value){
                        setState(() {
                          height = value;
                        });

                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                            color : Colors.teal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),
                          Text('${weight}' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'weight-',
                                onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              } , child:Text('-' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),),
                              SizedBox(width: 20.0),
                              FloatingActionButton(
                                heroTag: 'weight+',
                                onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              } , child:Text('+' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0 ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color : Colors.teal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('AGE' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),
                          Text('${age}' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'age-',
                                onPressed: (){
                                setState(() {
                                  age--;
                                });
                              } , child:Text('-' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),),
                              SizedBox(width: 20.0),
                              FloatingActionButton(
                                heroTag: 'age+',
                                onPressed: (){
                                setState(() {
                                 age++;
                                });
                              } , child:Text('+' , style : TextStyle(fontSize: 25.0 ,color : Colors.white)),),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 65.0,
              width: double.infinity,
              child: MaterialButton(onPressed: (){
                double result = weight + height ;
                print(result.round());


                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResultScreen(
                      ismale: isMale,
                      result: result.round(),
                      age: age,
                    ),

                    )
                );

              } ,
                color: Colors.teal ,child: Text('Calculat' , style: TextStyle(fontSize: 30.0, color: Colors.white)),)),

        ],
      ),

        );








  }
}
