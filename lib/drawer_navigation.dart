import 'package:flutter/material.dart';
import 'package:flutterwebview/webview_screen.dart';
import 'package:flutterwebview/webview_staff.dart';
import 'package:flutterwebview/webview_student.dart';
import 'package:flutterwebview/webview_teacher.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard_menu.dart';

class Drawernavigation extends StatelessWidget {
  const Drawernavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('asset/wallpaperdrawer.jpg'),
                  fit: BoxFit.cover,
                )),
            child: Text(
              'GPPNC',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DashboardMenu()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text('Admin Login'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WebViewScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text('Accountant Login'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WebViewScreen()));
            },
          ),

          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text('Teacher Login'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WebViewTeacher()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text('Staff Login'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WebViewStaff()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login_rounded),
            title: Text('Student Login'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WebViewStudent()));
            },
          ),

          ListTile(
              leading: Icon(Icons.call),
              title: Text('Call'),
              onTap: ()async {

                  Uri phoneNumber = Uri.parse('tel:+8801730943201');
                  if (await launchUrl(phoneNumber)) {
                    //dialer opened
                  }else{
                    print('dailer is not opened');
                  }

              }),
          ListTile(
              leading: Icon(Icons.email), title: Text('E-mail'), onTap: ()  {
                //pasango2007@gmail.com
            launch("mailto:<pasango2007@gmail.com>");
            // launch("mailto:<pasango2007@gmail.com>?subject=<subject>&body=<body>");


          }),
          ListTile(
              leading: Icon(Icons.web), title: Text('Facebook'), onTap: ()  {
            launch('https://www.facebook.com/pasanc20');
          }),
        ],
      ),
    );
  }
}
