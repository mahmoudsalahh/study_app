import 'package:flutter/material.dart';

Widget defaultButton ({
  double width = double.infinity ,
  Color background = Colors.teal,
  required VoidCallback  onpressed ,
  required String text ,})=> Container(
  width: width,
  color : background,
  child: MaterialButton(
    onPressed:
      onpressed,
    child:Text( text,

        style : TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
    ),

  ),
);


Widget defaulttextformfeild({
required TextEditingController controller ,
required TextInputType type ,
required String label ,
required FormFieldValidator validate ,
  required IconData prefix ,

})=>TextFormField(
  controller: controller ,
  keyboardType: TextInputType.emailAddress,
  decoration: InputDecoration(
    labelText: label , labelStyle: TextStyle(fontWeight: FontWeight.bold,),
    prefixIcon: Icon(prefix),
    border: OutlineInputBorder(),
  ),
  validator:validate
);
