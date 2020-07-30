import 'package:Hata/theme.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

const CLIENT__ID =
    "232071354548-orae1bp976901sqeim69bilepbd3a8g9.apps.googleusercontent.com";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hata',
      theme: getThemeData(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/drive.appdata',
      'https://www.googleapis.com/auth/drive.file',
    ],
  );
  // _launchURL(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url, forceWebView: true, enableJavaScript: true);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
  Future<void> _handleSignIn() async {
    try {
      final credentials = await _googleSignIn.signIn();
      // var drive = new DriveApi();
      //   print(await drive.about.get());
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();

    _handleSignIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[Text('Hello')],
      ),
    );
  }
}

class Webview extends StatelessWidget {
  final url;
  const Webview({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
    );
  }
}
