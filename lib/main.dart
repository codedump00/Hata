import 'package:Hata/pages/home/home.dart';
import 'package:Hata/state/theme.dart';
import 'package:Hata/state/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BootStrapper());
}

class BootStrapper extends StatelessWidget {
  const BootStrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => UserState(),
      ),
      ChangeNotifierProvider(
        create: (context) => AppTheme(),
      )
    ], child: App());
  }
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<UserState>(context).handleInitialLoad();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hata',
      theme: Provider.of<AppTheme>(context).theme,
      home: Hata(),
    );
  }
}

// Future<void> _handleSignIn() async {
//   try {
//     final credentials = await _googleSignIn.signIn();
//     // var drive = new DriveApi();
//     //   print(await drive.about.get());
//   } catch (error) {
//     print(error);
//   }
// }
