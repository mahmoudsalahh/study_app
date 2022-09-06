import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
           Container(width: double.infinity,height: 50,),
           Text('Upgrade to Plus' ,style: TextStyle(fontSize: 20 ,color: Colors.blue ,fontWeight: FontWeight.w700),),
          SizedBox(height: 60,),
          InkWell(
            onTap: (){},
            child: Container(
                width: double.infinity,
                height: 40,
                child: Row(
                  children: [
                    Icon(Icons.key ,color: Colors.deepPurple),
                    SizedBox(width: 15,),
                    Text('Study and Configration' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios ,color: Colors.black87),

                  ],
                )),
          ),
          Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.help ,color: Colors.green),
                  SizedBox(width: 15,),
                  Text('Help And Feedback' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios ,color: Colors.black87),

                ],
              )),
          SizedBox(height: 30,),
          Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.notification_add ,color: Colors.red),
                  SizedBox(width: 15,),
                  Text('Notifications' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios ,color: Colors.black87),

                ],
              )),
          Container(
              width: double.infinity,
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.backup ,color: Colors.blue),
                  SizedBox(width: 15,),
                  Text('BackUp' ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios ,color: Colors.black87),

                ],
              )),
          SizedBox(height: 30,),
          Container(
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.person ,color: Colors.blue),
                  MaterialButton(onPressed: (){},child: Text('Profile' ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w600),),),
                  Spacer(),
                  CircleAvatar(
                    radius: 16.5,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/study.jpg'),
                      radius: 15,
                    ),
                  )
                ],
              ))



        ],
      ),
    );
  }
}
