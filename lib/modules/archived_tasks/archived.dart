import 'package:flutter/material.dart';

class ArchivedTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity ,
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
          Text(
            'ARCHIVED TASKS' ,
            style: TextStyle(fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
