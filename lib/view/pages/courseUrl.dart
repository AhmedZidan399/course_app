// ignore_for_file: deprecated_member_use, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CourseView extends StatefulWidget {
  final String courseUrl;
  CourseView({required this.courseUrl});

  @override
  _CourseViewState createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final Completer<InAppWebViewController> _controller = Completer<InAppWebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: InAppWebView(
            initialUrlRequest: URLRequest(
               url: WebUri(widget.courseUrl)),
            
            
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onLoadStart: (controller, url) {
              print("Started loading: $url");
            },
            onLoadStop: (controller, url) async {
              print("Finished loading: $url");
            },
            onLoadError: (controller, url, code, message) {
              print("Error loading: $url, Error: $message");
            },
          ),
        ),
      ),
    );
  }
}


