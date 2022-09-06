import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salahh/modules/archived_tasks/archived.dart';
import 'package:salahh/modules/done_tasks/done_tasks.dart';
import 'package:salahh/modules/agenda/agenda.dart';
import 'package:salahh/shared/cubit/states.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0 ;
  List tasks =[
    Agenda(),
    DoneTasks(),
    ArchivedTasks()
  ];
  List titles =[
    'New Tasks',
    'DoneTasks',
    'Archived Tasks'
  ];
void changeBar(index){
  currentIndex =index;
  emit(AppChangeState());
}

}