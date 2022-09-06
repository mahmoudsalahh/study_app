
import 'package:flutter/material.dart';
class UserModel{
   String? subjectColor ;
   String? subjectName ;
   String? time ;
   UserModel(this.subjectColor,this.time,this.subjectName);
  UserModel.fromDatabase(Map<String , dynamic> data){
    subjectColor = data['color'];
    subjectName = data['title'];
    time = data['time'];

  }
}