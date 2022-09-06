import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.teal ,
        leading: Icon(Icons.access_alarm),
        title : Text('APP BAR'),
        actions: [
          IconButton (
          icon : Icon(Icons.add_a_photo),
            onPressed: (){
               print('mahmoud');
            },
          ),
        ]
    ),
      body : Container(
        width: double.infinity,
        color: (Colors.white),
      child : Column (
        mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadiusDirectional.circular(20.0),
               ),
               clipBehavior: Clip.antiAliasWithSaveLayer,
               child: Stack(
                 alignment: Alignment.bottomCenter,
                 children: [
                   Image(
                        image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg'),
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,

                      ),
                   Container(
                     color: Colors.black.withOpacity(0.7),
                     padding:EdgeInsetsDirectional.only(
                       start: 10.0,
                       end: 10.0,
                     ),
                     child: Text(
                       'Welcom to world',style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                     ),),
                   ),
                 ],
               ),
             ),
          Container(
            color : (Colors.black38),
          child : Text (
           'begginer flutter',
           style: TextStyle(
             backgroundColor: Colors.white,
             fontSize: 30.0,
             color: Colors.black38,
             fontWeight:FontWeight.bold,
           ),
         ),),
          Container(
            child: Text (
              'mahmoud salah',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.lightGreenAccent,
              ),
            ),
          ),
          Container(
            child: Text (
              'mohamed tarek',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
          ),

        ],
      ),
      ),
    );

  }


}