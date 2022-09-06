import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salahh/shared/app_provider/provider.dart';

class DoneTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> AppProvider(),
    child: Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        Text(
          'DONE TASKS' ,
          style: TextStyle(fontSize: 30.0),
        ),
        SizedBox(height: 50),
        IconButton(onPressed: (){
          //context.read<AppProvider>().getFromDatabase(context.read<AppProvider>().database);
        }, icon: Icon(Icons.add))
      ],
    ));
  }
}
