
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salahh/models/user/user_model.dart';
import 'package:salahh/shared/app_provider/provider.dart';

class Agenda extends StatelessWidget {
 //var item;
//NewTasks(this.item);
  @override
  Widget build(BuildContext context) {
    //item = Provider.of<AppProvider>(context, listen: true).gettask;
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppProvider(),
      //builder: ( context ,  getData()?),
      child: Expanded(
        child: ListView.separated(
          physics:BouncingScrollPhysics() ,
            itemBuilder: (context, index) => getData(),
            separatorBuilder: (context, index) => Divider(),
            itemCount:10,
            //context.watch<AppProvider>().gettask!.length
        ),
      ),
    );
  }

  Widget getData(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 60.0,
        width: double.infinity,
        child: Row(
          children: [
            // CircleAvatar(
            //   backgroundColor: Colors.amber[700],
            //   radius: 50.0,
            //   child: Text('kfmlc',style:TextStyle( fontSize: 15.0 ,color: Colors.white)),
            // ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(10))
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 10,
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(10))
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 90,
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('MAhmooud'),
                        Text('22.00',style:TextStyle(fontWeight: FontWeight.bold , fontSize: 15.0)),

                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(width: 50.0,),
            Text('FHshhjdop',style:TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0)),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }

}


