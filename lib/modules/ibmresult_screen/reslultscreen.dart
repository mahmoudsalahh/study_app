import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  bool ismale ;
  int result ;
  int age ;

  ResultScreen({
    required this.ismale ,
    required this.result ,
    required this.age ,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text ('Result Screen'),
      ),
      body : Container(
        width: double.infinity,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text ('Gender : ${ismale ? 'Male' : 'Female'} ' , style : TextStyle(fontSize: 30.0 , color : Colors.white)),
            Text ('Result : ${result} ' , style : TextStyle(fontSize: 30.0, color : Colors.white)),
            Text ('Age : ${age} ' , style : TextStyle(fontSize: 30.0, color : Colors.white)),
          ],
        ),
      ),








    );
  }
}
