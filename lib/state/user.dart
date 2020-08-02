import 'dart:convert' show jsonEncode, jsonDecode;
import 'dart:io' show File, Directory;

import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

const _SCOPES = const [
  'https://www.googleapis.com/auth/drive.appdata',
  'https://www.googleapis.com/auth/drive.file',
];

const _DATA_FILE = "Hata.json";

class UserState extends ChangeNotifier {
  handleInitialLoad() async {
    if (appData == null) {
      if (await _googleSignIn.isSignedIn()) {
        account = _googleSignIn.currentUser;
      }

      directory = await getApplicationDocumentsDirectory();
      final String filePath = '${directory.path}/$_DATA_FILE';
      if (await File(filePath).exists()) {
        String jsonStr = await File(filePath).readAsString();
        Map<String, dynamic> json = jsonDecode(jsonStr);
        appData = HataAppJsonData.fromJson(json);
        print(json);
      } else {
        File jsonFile = await File(filePath).create();
        appData = HataAppJsonData(library: [], recents: []);
        jsonFile.writeAsString(appData.toJsonString());
      }
    }
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: _SCOPES);

  GoogleSignInAccount _account;

  GoogleSignInAccount get account => _account;

  set account(GoogleSignInAccount newAccount) {
    _account = newAccount;
    notifyListeners();
  }

  Directory _appDirectory;

  Directory get directory => _appDirectory;

  set directory(Directory newdirectory) {
    _appDirectory = newdirectory;
    notifyListeners();
  }

  HataAppJsonData _appData;

  HataAppJsonData get appData => _appData;

  set appData(HataAppJsonData newData) {
    _appData = newData;
    notifyListeners();
  }

  updateFile() {
    File file = File('${directory.path}/$_DATA_FILE');
    file.writeAsString(appData.toJsonString());
  }
}

class HataAppJsonData {
  List<HataFileRef> recents = [];
  List<HataFileRef> library = [];

  HataAppJsonData({this.recents, this.library});

  HataAppJsonData.fromJson(json)
      : recents = json['recents']
            .map<HataFileRef>((path) => HataFileRef(path))
            .toList(),
        library = json['library']
            .map<HataFileRef>((path) => HataFileRef(path))
            .toList();

  addToRecent(String path) {
    recents.add(HataFileRef(path));
  }

  rmFromRecent(String path) {
    recents.removeWhere((ref) => ref.path == path);
  }

  addToLibrary(String path) {
    library.add(HataFileRef(path));
  }

  rmFromLibrary(String path) {
    library.removeWhere((ref) => ref.path == path);
  }

  addToBoth(String path) {
    HataFileRef ref = HataFileRef(path);
    library.add(ref);
    recents.add(ref);
  }

  rmFromBoth(String path) {
    library.removeWhere((ref) => ref.path == path);
    recents.removeWhere((ref) => ref.path == path);
  }

  toJson() => {'recents': recents, 'library': library};

  toJsonString() => jsonEncode({
        'recents': recents.map((e) => e.path).toList(),
        'library': library.map((e) => e.path).toList(),
      });
}

class HataFileRef {
  String path;
  HataFileRef(this.path);
  get name => basename(path);
}
