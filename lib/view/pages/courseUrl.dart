import 'dart:async';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CourseView extends StatefulWidget {
  final String  courseUrl;
  CourseView({required this.courseUrl});

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    // Optionally, you can listen to webview events
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      print("State: ${state.type} ${state.url}");
    });
  }
  // @override    
  // void initState() {
  //   super.initState();
  //   // Enable hybrid composition for Android if necessary
  //   if (Platform.isAndroid) {
  //     WebView.platform = SurfaceAndroidWebView();
  //   }
  // }
  

 @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  WebviewScaffold(
      url: widget.courseUrl,
      appBar: AppBar(
        title: Text("WebView Example Replacement"),
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    // Scaffold(
    //   body: SafeArea(
    //     child: Container(
    //       height: MediaQuery.of(context).size.height,
    //       width: MediaQuery.of(context).size.width,
    //       child: 
    //       WebView(
    //         initialUrl: widget.courseUrl,
    //         javascriptMode: JavascriptMode.unrestricted,
    //         onWebViewCreated: ((WebViewController webviewController) {
    //           _controller.complete(webviewController);
    //         }),
    //       ),
    //     ),
    //   ),
    // );
  }
  
}

