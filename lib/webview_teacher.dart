import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'drawer_navigation.dart';

class WebViewTeacher extends StatefulWidget {
  const WebViewTeacher({Key? key}) : super(key: key);

  @override
  State<WebViewTeacher> createState() => _WebViewTeacherState();
}

class _WebViewTeacherState extends State<WebViewTeacher> {
  InAppWebViewController? webViewController;
  PullToRefreshController? refreshController;
  late var url;
  var inicialURL = "http://gppnc.com/teacher";
  double progress = 0;
  var urlController = TextEditingController();
  var isLoading = false;

  //net check start
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnected = false;

  //net check end

  @override
  void initState() {
    super.initState();
    refreshController = PullToRefreshController(
        onRefresh: () {
          webViewController!.reload();
        },
        options: PullToRefreshOptions(
          color: Colors.white,
          backgroundColor: Colors.black87,
        ));

    startStreaming();
  }

  //for net check start
  checkInternet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isConnected = true;
    } else {
      isConnected = false;
      showDialogBox();
    }
    setState(() {});
  }

  showDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text('No Internet'),
              content: Text('Please check your Internet Connection'),
              actions: [
                CupertinoButton.filled(
                    child: Text('Retry'),
                    onPressed: () {
                      Navigator.pop(context);
                      checkInternet();
                    }),
              ],
            ));
  }

  startStreaming() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkInternet();
    });
  }

  //for net check start end
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   onPressed: () async {
          //     if (await webViewController!.canGoBack()) {
          //       webViewController!.goBack();
          //     }
          //   },
          //   icon: Icon(Icons.arrow_back_ios),
          // ),
          // title: Container(
          //   padding: EdgeInsets.symmetric(horizontal: 4.0),
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(12)),
          //   child: TextField(
          //     onSubmitted: (value) {
          //       url = Uri.parse(value);
          //       if (url.scheme.isEmpty) {
          //         url = Uri.parse("${inicialURL}search?q=$value");
          //       }
          //       webViewController?.loadUrl(urlRequest: URLRequest(url: url));
          //     },
          //     controller: urlController,
          //     textAlignVertical: TextAlignVertical.center,
          //     decoration: InputDecoration(
          //         hintText: "Type URL or Search Somthing",
          //         prefixIcon: Icon(Icons.search)),
          //   ),
          // ),
          actions: [
            IconButton(
                onPressed: () {
                  SystemNavigator.pop();
                },
                icon: Icon(Icons.exit_to_app)),
            IconButton(
                onPressed: () {
                  webViewController!.reload();
                },
                icon: Icon(Icons.refresh)),
            IconButton(
                onPressed:() async {
                  if (await webViewController!.canGoBack()) {
                    webViewController!.goBack();
                  }
                },
                icon: Icon(Icons.arrow_back_ios)),
          ],
        ),
        drawer: Drawernavigation(),
        body: Column(
          children: [
            Expanded(
                child: Stack(
              alignment: Alignment.center,
              children: [
                InAppWebView(
                  onLoadStart: (controller, url) {
                    var v = url.toString();
                    setState(() {
                      isLoading = true;
                      urlController.text = v;
                    });
                  },
                  onLoadStop: (controller, url) {
                    refreshController!.endRefreshing();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      refreshController!.endRefreshing();
                    }
                    setState(() {
                      this.progress = progress / 100;
                    });
                  },
                  pullToRefreshController: refreshController,
                  onWebViewCreated: (controller) =>
                      webViewController = controller,
                  initialUrlRequest: URLRequest(url: Uri.parse(inicialURL)),
                ),
                Visibility(
                    visible: isLoading,
                    child: CircularProgressIndicator(
                      value: progress,
                      valueColor: AlwaysStoppedAnimation(Colors.redAccent),
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}


