
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salahh/shared/app_provider/provider.dart';

class Subjects extends StatelessWidget {
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
            itemBuilder: (context, index) => getData(),
            separatorBuilder: (context, index) => Divider(),
            itemCount: 10
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
            CircleAvatar(
              backgroundColor: Colors.amber[700],
              radius: 50.0,
              child: Text('kfmlc',style:TextStyle( fontSize: 15.0 ,color: Colors.white)),
            ),
            SizedBox(width: 20.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2545',style:TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0)),
                SizedBox(height: 10.0,),
                Text('2.024',style:TextStyle( fontSize: 15.0 ,color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }

}

