import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyAppp());
}

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Termm(),
    );
  }
}

class Termm extends StatefulWidget {
  const Termm({Key? key}) : super(key: key);

  @override
  TermmState createState() {
    return TermmState();
  }
}

class TermmState extends State<Termm> {
  @override
  Widget build(BuildContext context) {
    late WebViewController controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Use'),
      ),
      body: SafeArea(child: Builder(builder: (BuildContext context) {
        controller = WebViewController();
        controller.loadRequest(Uri.parse(
            "https://harumi91782072.wordpress.com/2023/06/23/terms-of-use/"));
        controller.setJavaScriptMode(JavaScriptMode.unrestricted);
        return WebViewWidget(
          controller: controller,
        );
      })),
    );
  }
}
