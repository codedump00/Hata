import 'package:Hata/pages/reader/reader.dart';
import 'package:Hata/pages/reader/widgets/BookCard.dart';
import 'package:Hata/state/user.dart';
import 'package:Hata/widgets/Appbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'package:provider/provider.dart';

class Hata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<UserState>(context);

    List<Widget> buildRecentCards() {
      if (userState.appData == null)
        return [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Card(
              child: Container(
                height: 150,
                width: 120,
                alignment: Alignment.center,
                child: CupertinoActivityIndicator(),
              ),
            ),
          )
        ];
      if (userState.appData.recents.length == 0)
        return [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Card(
              child: Container(
                alignment: Alignment.center,
                height: 150,
                width: 120,
                child: Text('No recent books!'),
              ),
            ),
          )
        ];
      return userState.appData.recents
          .map<Widget>(
            (e) => Padding(
              padding: EdgeInsets.only(right: 20),
              child: BookCard(path: e.path),
            ),
          )
          .toList();
    }

    return Scaffold(
      appBar: PreferredSize(
        child: Appbar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              size: 30.0,
            ),
            tooltip: 'Menu',
            onPressed: () {},
          ),
          // title: Text('Hata'),
        ),
        preferredSize: Size.fromHeight(60),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              'Recent Books',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: SizedBox.fromSize(
              size: Size.fromHeight(150),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: buildRecentCards(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: Text(
              'Library',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            child: SizedBox.fromSize(
              size: Size.fromHeight(150),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.filled(
                  6,
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Card(
                      child: Container(
                        height: 150,
                        width: 120,
                        child: Text(''),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: CupertinoButton(
              child: Text(
                'Add a book to library',
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () async {
                String path = await FilePicker.getFilePath();
                if (path != null) {
                  userState.appData.addToBoth(path);
                  userState.updateFile();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Reader(document: path),
                    ),
                  );
                }
              },
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          )
        ],
      ),
    );
  }
}
