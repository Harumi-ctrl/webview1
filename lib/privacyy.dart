import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApppp());
}

class MyApppp extends StatelessWidget {
  const MyApppp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Pr(),
    );
  }
}

class Pr extends StatefulWidget {
  const Pr({Key? key}) : super(key: key);

  @override
  PyState createState() {
    return PyState();
  }
}

class PyState extends State<Pr> {
  @override
  Widget build(BuildContext context) {
    late WebViewController controller;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SafeArea(child: Builder(builder: (BuildContext context) {
        controller = WebViewController();
        controller.loadRequest(Uri.parse(
            "https://harumi91782072.wordpress.com/2023/06/23/privacy-policy/"));
        controller.setJavaScriptMode(JavaScriptMode.unrestricted);
        return WebViewWidget(
          controller: controller,
        );
      })),
    );
  }
}
