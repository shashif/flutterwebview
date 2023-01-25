import 'package:flutter/material.dart';
import 'package:flutterwebview/webview_screen.dart';
import 'package:flutterwebview/webview_staff.dart';
import 'package:flutterwebview/webview_student.dart';
import 'package:flutterwebview/webview_teacher.dart';

import 'drawer_navigation.dart';

class DashboardMenu extends StatefulWidget {
  const DashboardMenu({Key? key}) : super(key: key);

  @override
  State<DashboardMenu> createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      drawer: Drawernavigation(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebViewScreen()));
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login_sharp),
                      Text('Admin Login'),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebViewScreen()));
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login_sharp),
                      Text('Accountant Login'),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebViewTeacher()));
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login_sharp),
                      Text('Teacher Login'),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebViewStaff()));
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login_sharp),
                      Text('Staff Login'),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WebViewStudent()));
              },
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                elevation: 10,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login_sharp),
                      Text('Student Login'),
                    ],
                  ),
                ),
              ),
            ),

          ],
        )),
      ),
    ));
  }
}
