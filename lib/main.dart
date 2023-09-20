//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:webview1/privacyy.dart';
import 'package:webview1/termm.dart';
import 'package:webview_flutter/webview_flutter.dart';

///////////twitter,youtube,facebook,instagramのURLも追加する
void main() => runApp(const MyApp(
      title: '',
      url: '',
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.title, required this.url})
      : super(key: key);
  final String title;
  final String url;

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
//  AudioPlayer audioplayer = AudioPlayer();
//  bool isPlaying = false;

  ///  const MyApp({Key? key}) : super(key: key);
//  @override
//  void initState() {
//    super.initState();
//    audioplayer.setSourceUrl('assets/audio/audio1.mp3');
//    audioplayer.setReleaseMode(ReleaseMode.loop);
//    audioplayer.play('assets/audio/audio1.mp3' as Source);

//    audioplayer.onPlayerStateChanged.listen((event) {
//      setState(() {
//        isPlaying = (event == PlayerState.playing);
//      });
//    });
  // }

////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    late WebViewController controller;
    //  Logger logger = Logger();
    //   final NavigationDelegate action = NavigationDelegate();
    // ProgressDialog pr ;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WillPopScope(
            onWillPop: () async {
              if (await controller.canGoBack()) {
                controller.goBack();
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
              appBar: AppBar(
                  title: const Text('Japan Tour Hallelujah'),
                  backgroundColor: Colors.red,
                  //              leading: IconButton(
                  //               icon: const Icon(Icons.arrow_back),
//                onPressed: () {
                  //                 controller.clearCache();
//                },
//              ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () async {
                        if (await controller.canGoBack()) {
                          controller.goBack();
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        controller.reload();
                      },
                    ),
                  ]
                  /////////////////////
                  ),
              drawer: Drawer(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Terms of Service'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Termm()),
                        );
                      },
                    ),
                    ListTile(
                      title: const Text('Privacy Policy'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Pr()),
                        );
                      },
                    ),
//                    TextButton(
//                      onPressed: () async {
//                        if (isPlaying) {
//                          await audioplayer.pause();
//                        } else {
//                          await audioplayer
//                              .play(AssetSource("assets/audio/audio1.mp3"));
//                          await audioplayer.setReleaseMode(ReleaseMode.loop);
//                        }
//                      },
//                      child: const Icon(Icons.swap_horiz),
//                    ),
                  ],
                ),
              ),
              body: SafeArea(child: Builder(builder: (BuildContext context) {
                controller = WebViewController();
                controller.loadRequest(
                    Uri.parse("https://harumi91782072.wordpress.com/"));
                controller.setJavaScriptMode(JavaScriptMode.unrestricted);
                return WebViewWidget(
                  controller: controller,
                );
              })),
            )));
  }
}

                    
                  
                
              
            
  


//enum LaunchMode {
//  platformDefault,
//  inAppWebView,
//  externalApplication,
//  externalNonBrowserApplication,
//}