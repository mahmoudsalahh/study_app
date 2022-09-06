import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:salahh/models/colorModel.dart';
import 'package:salahh/modules/archived_tasks/archived.dart';
import 'package:salahh/modules/done_tasks/done_tasks.dart';
import 'package:salahh/shared/app_provider/provider.dart';
import 'package:salahh/shared/cubit/cubit.dart';
import 'package:salahh/shared/cubit/states.dart';
import 'package:salahh/shared/shared.component/component.dart';
import 'package:sqflite/sqflite.dart';


class HomeLayout extends StatefulWidget {

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {


  var scaffoldkey = GlobalKey<ScaffoldState>();

  var controllertitle = TextEditingController();

  var controllertime = TextEditingController();

  var controllerColor= TextEditingController();

  var formkey = GlobalKey<FormState>();

   Icon? floatIcon =Icon(Icons.edit);
  bool isIcon = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> AppProvider(),
      child: Scaffold(
        key: scaffoldkey,
        // appBar: AppBar(
        //   title: Text('${context.watch<AppProvider>().titles[context.watch<AppProvider>().currentIndex]}'),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              context.watch<AppProvider>().tasks[context.watch<AppProvider>().currentIndex],
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(
            color: Colors.black,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.grey,
          ),
          fixedColor: Colors.black,
          onTap: (index){
            context.read<AppProvider>().changeBar(index);
          },
          currentIndex: context.watch<AppProvider>().currentIndex,
          items:
            context.watch<AppProvider>().bottomNavBarItem,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          elevation: 0.0,
          onPressed: (){
            if (isIcon){
              if(formkey.currentState!.validate()){
              context.read<AppProvider>().insertToDatabase(
                  title: controllertitle.text,
                  time: controllertime.text,
                  color: controllerColor.text
              ).then((value){
                Navigator.pop(context);
                controllertitle.text ='';
                controllertime.text = '';
                controllerColor.text= '' ;
                isIcon = false;
                setState(() {
                  floatIcon =Icon(Icons.done);
                });
              });
           //   controllertitle.text='';
           //  controllertime.text='';
           // controllerdate.text='';


            }
            }
            else{
              scaffoldkey.currentState!.showBottomSheet((context) =>
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 300,
                      child: Stack(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                image: DecorationImage(image:AssetImage('images/study1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                          ),
                          Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Form(
                                key: formkey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: controllertitle,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3, color: Colors.black),
                                        ),
                                        hoverColor: Colors.blueGrey,
                                        labelText: 'New Task',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                                        prefixIcon: Icon(Icons.task),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value)
                                      {
                                        if(value!.isEmpty)
                                        {
                                          return 'field is Empty';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height:10.0),
                                    TextFormField(
                                      controller: controllertime,
                                      //keyboardType: TextInputType.visiblePassword,
                                      //obscureText: true,
                                      onTap: (){
                                        showTimePicker(
                                          context: context,
                                          initialTime:TimeOfDay.now(),
                                        ).then((value) {
                                          controllertime.text = value!.format(context);
                                        });
                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3, color: Colors.black),
                                        ),
                                        labelText: 'Time',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                                        //prefixIcon: Icon(Icons.task),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value)
                                      {
                                        if(value!.isEmpty)
                                        {
                                          return 'field is Empty';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height:10.0),
                                    TextFormField(
                                      controller: controllerColor,
                                      onTap: (){
                                        scaffoldkey.currentState!.showBottomSheet((context)=>
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Container(
                                                width: 350,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12,
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                                child:  ListView.builder(
                                                  itemBuilder: (context, index) => getData(isColor[index]),
                                                  itemCount: isColor.length,
                                              ),
                                            )
                                        ));

                                      },
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(width: 3, color: Colors.black),
                                        ),
                                        labelText: 'Color',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                                        //prefixIcon: Icon(Icons.task),
                                        border: OutlineInputBorder(),
                                      ),
                                      validator: (value)
                                      {
                                        if(value!.isEmpty)
                                        {
                                          return 'field is Empty';
                                        }
                                        return null;
                                      },
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
              isIcon = true;
              setState(() {
                floatIcon = Icon(Icons.add);
              });

            }

          },
          child: floatIcon ,
        ),
      ),

    );
  }
  Widget getData(Colorsd  color ){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: InkWell(
        onTap: (){
          controllerColor.text = color.colorName;
          scaffoldkey.currentState!.showBottomSheet((context) =>
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 300,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            image: DecorationImage(image:AssetImage('images/study1.jpg'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                      ),
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFormField(
                                  controller: controllertitle,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.black),
                                    ),
                                    hoverColor: Colors.blueGrey,
                                    labelText: 'New Task',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                                    prefixIcon: Icon(Icons.task),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'field is Empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height:10.0),
                                TextFormField(
                                  controller: controllertime,
                                  //keyboardType: TextInputType.visiblePassword,
                                  //obscureText: true,
                                  onTap: (){
                                    showTimePicker(
                                      context: context,
                                      initialTime:TimeOfDay.now(),
                                    ).then((value) {
                                      controllertime.text = value!.format(context);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.black),
                                    ),
                                    labelText: 'Time',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                                    //prefixIcon: Icon(Icons.task),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'field is Empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height:10.0),
                                TextFormField(
                                  controller: controllerColor,
                                  onTap: (){
                                    scaffoldkey.currentState!.showBottomSheet((context)=>
                                        Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              width: 350,
                                              height: 200,
                                              decoration: BoxDecoration(
                                                  color: Colors.black12,
                                                  borderRadius: BorderRadius.circular(20)
                                              ),
                                              clipBehavior: Clip.antiAliasWithSaveLayer,
                                              child:  ListView.builder(
                                                itemBuilder: (context, index) => getData(isColor[index]),
                                                itemCount: isColor.length,
                                              ),
                                            )
                                        ));

                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(width: 3, color: Colors.black),
                                    ),
                                    labelText: 'Color',labelStyle: TextStyle(fontWeight: FontWeight.bold,),
                                    //prefixIcon: Icon(Icons.task),
                                    border: OutlineInputBorder(),
                                  ),
                                  validator: (value)
                                  {
                                    if(value!.isEmpty)
                                    {
                                      return 'field is Empty';
                                    }
                                    return null;
                                  },
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
        child: Container(
          height: 60.0,
          width: double.infinity,
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor:color.iscolor,
                radius: 50.0,
              ),
              SizedBox(width: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${color.colorName}',style:TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Color isColor1 = Colors.red;
  // List<Color>? isColor = [
  //   Colors.red,
  //   Colors.blue,
  //   Colors.yellow,
  // ];

}

