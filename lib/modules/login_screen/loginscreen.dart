import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salahh/main.dart';
import 'package:salahh/modules/designmessanger/desginmessanger.dart';
import 'package:salahh/shared/shared.component/component.dart';
class LoginScreen extends StatelessWidget {
  Icon suffix = Icon(Icons.remove_red_eye);
   var formkey = GlobalKey<FormState>();
   var emailcontroler = TextEditingController();
   var passwordcontroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key:formkey ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                         'login',
                       style: TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.bold,

                       ),


                     ),
                     SizedBox(
                       height: 30.0,
                     ),
                     defaulttextformfeild(
                         controller: emailcontroler,
                         type: TextInputType.emailAddress,
                         label: 'EMAIL',
                         prefix: Icons.email,
                         validate: (value){
                       if(value!.isEmpty)
                       {
                         return 'password is Empty';
                       }
                       return null;
                     }
                     ),
                     SizedBox(
                       height: 30.0,
                     ),
                     TextFormField(
                       controller: passwordcontroler,
                       keyboardType: TextInputType.visiblePassword,
                       obscureText: true,
                       decoration: InputDecoration(
                         labelText: 'Password',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                         prefixIcon: Icon(Icons.lock),
                         suffixIcon: suffix,
                         border: OutlineInputBorder(),

                       ),
                       validator: (value)
                       {
                         if(value!.isEmpty)
                         {
                           return 'password is Empty';
                         }
                         return null;
                       },
                     ),
                     SizedBox(
                       height: 30.0,
                     ),
                     defaultButton(
                       text: 'Login',
                       onpressed: (){
                         if(formkey.currentState!.validate()){

                           print(emailcontroler.text);
                           print(passwordcontroler.text);
                         }
                         Navigator.push(context, MaterialPageRoute(builder: (context)=> DesginMassanger(),)
                             
                         );

                       }
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text('Dont have an Acount',
                           style : TextStyle ( fontSize: 18.0,
                           fontWeight: FontWeight.bold,),
                         ),
                         SizedBox(
                           width: 20.0,
                         ),
                         TextButton(
                           onPressed: (){},
                           child: Text(
                               'Register',
                             style : TextStyle (
                               fontSize: 20.0,
                               fontWeight: FontWeight.bold,
                             )

                           ),
                         ),
                       ],
                     ),


],
),
          ),
        ),
      ),
    ),


    );
  }
}

