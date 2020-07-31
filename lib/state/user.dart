import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserState extends ChangeNotifier {
  UserState() {
    handleInitialLoad();
  }

  handleInitialLoad() async {
    if (await _googleSignIn.isSignedIn()) {
      account = _googleSignIn.currentUser;
    }
  }

  static const _SCOPES = const [
    'https://www.googleapis.com/auth/drive.appdata',
    'https://www.googleapis.com/auth/drive.file',
  ];
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: _SCOPES,
  );

  GoogleSignInAccount _account;

  get account => _account;

  set account(newAccount) {
    _account = newAccount;
    notifyListeners();
  }
}
