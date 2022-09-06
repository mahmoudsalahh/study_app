import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class DesginMassanger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.teal,
      titleSpacing: 12.0,
    title: Row(
      children: [
        CircleAvatar(
                     radius: 20.0,
          backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg'),
),
        SizedBox(
          width: 12.0,
        ),
        Text('Chats',
        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ],
    ),
      actions: [ IconButton(onPressed: (){}, icon:CircleAvatar(child: Icon(Icons.camera_alt,color: Colors.white,),
          backgroundColor: Colors.black12,),),
         IconButton(onPressed: (){}, icon:CircleAvatar(child: Icon(Icons.edit,color: Colors.white,),
          backgroundColor: Colors.black12,),),],
    ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black12,

                ),
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                    SizedBox(
                      width: 12.0,
                    ),
                    Text('Search', style : TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 90.0 ,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context ,index)
                    {
                      return buildStoryItem();
                    },
                  separatorBuilder: (context , index) => SizedBox (width: 10.0),
                  itemCount: 10,

                ),
              ),
              SizedBox(height: 15.0),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index)=> buildChatItem(),
                    separatorBuilder: (context , index)=> SizedBox(height: 10.0),
                    itemCount: 15),








            ]

      ),
        ),
    ),
    );
  }

  Widget buildStoryItem(){
    return Container(
      width: 60.0,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg'),
              ),
              CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.white,
              ),
              Padding(
                padding:
                const EdgeInsetsDirectional.only(bottom: 3.0,end: 3.0),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
          Text(
              'mahmoud salah esmail',
              maxLines: 2,
              overflow:TextOverflow.ellipsis ,
              style : TextStyle(fontSize: 13.0)),


        ],
      ),
    );
  }
  Widget buildChatItem(){
    return Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_960_720.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 3.0 , bottom: 3.0),
              child: CircleAvatar(
                radius: 6.0,
                backgroundColor: Colors.red,

              ),
            ),
          ],
        ),
        SizedBox(width: 10.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mahmoud Salah' , style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
              Container(
                child: Row(
                  children: [
                    Expanded(child: Text('ana lsa gay mn 3and samir w galy mn benha l kafr shokr  ' ,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 18.0 , fontWeight: FontWeight.bold),)),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration:  BoxDecoration(
                          color: Colors.blueGrey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text('12.00 PM', style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ],
          ),
        ),



      ],


    );
  }
}
