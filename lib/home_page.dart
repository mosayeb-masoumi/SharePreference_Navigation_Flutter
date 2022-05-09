import 'package:flutter/material.dart';
import 'package:navigation_drawer_flutter/app_share_preference.dart';
import 'package:navigation_drawer_flutter/navigation_drawer_left_to_right.dart';
import 'package:navigation_drawer_flutter/navigation_drawer_right_to_left.dart';
import 'package:navigation_drawer_flutter/navigation_right_to_left_sub_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>(); // to change the icon of drawer

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // to change the icon of drawer

      drawer: const NavigationDrawerLeftToRight(),  // open left to right
      // endDrawer: const NavigationDrawerRightToLeft(), // open right to left
      endDrawer: const NavigationDrawerRightToLeftSubList(), // open right to left

      appBar: AppBar(
          title: Text("drawer flutter"),
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(), // to change the icon of drawer
          ),


          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.storage),
                onPressed: () {
                  _scaffoldKey.currentState?.openEndDrawer(); // to change the icon of drawer
                },
              ),
            )
          ]),



      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
                child: Text("save string , int  , double, list , DateTime"),
                onPressed: () async {
                  await AppSharePreference.setStringUserName("hassan");
                  await AppSharePreference.setIntAge(10);
                  await AppSharePreference.setDoubleTempreture(10.5);
                  await AppSharePreference.setBoolGender(true);

                  List<String> petList = ["cat", "cow", "giraffe"];
                  await AppSharePreference.setPetList(petList);
                }),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
                child: Text("Get string , int  , double, list , DateTime"),
                onPressed: () {
                  String name = AppSharePreference.getStringUserName() ?? "";
                  print(name);
                  var dd = name;

                  int age = AppSharePreference.getIntAge() ?? 0;
                  var ff = age;

                  double temp = AppSharePreference.getDoubleTempreture() ?? 0.0;
                  var nn = temp;

                  bool boolGender = AppSharePreference.getBoolGender() ?? false;
                  var hh = boolGender;

                  var petList = AppSharePreference.getPetList() ?? [];
                  var ss = petList;
                })
          ],
        ),
      ),
    );
  }
}
