import 'package:Hata/state/theme.dart';
import 'package:Hata/widgets/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Hata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hata',
      theme: Provider.of<AppTheme>(context).theme,
      home: Scaffold(
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
              child: RaisedButton(
                child: Text(
                  'Add a book to library',
                  style: TextStyle(fontSize: 16.0),
                ),
                onPressed: () {},
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            )
          ],
        ),
      ),
    );
  }
}
