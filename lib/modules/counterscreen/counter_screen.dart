import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {


  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int count = 1 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Counter'),
      ),
      body : Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextButton(onPressed: (){
              setState(() {
                count--;
                print(count);
              });
            }, child: Text('MINUS' , style : TextStyle(fontSize: 20.0)),),
            Padding( padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                  '$count',
                style: TextStyle(fontSize: 40.0,fontWeight: FontWeight.bold , color: Colors.teal),
              ),
            ),
            TextButton(onPressed: (){
              setState(() {
                count++;
                print(count);
              });
            }, child: Text('PLUS' , style : TextStyle(fontSize: 20.0)),

            ),
          ],

        ),
      )




    );
  }
}
