import 'package:Hata/pages/reader/reader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class BookCard extends StatefulWidget {
  final String path;
  BookCard({Key key, this.path}) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState(path);
}

class _BookCardState extends State<BookCard> {
  _BookCardState(this.path);
  final String path;
  PdfController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PdfController(
      document: PdfDocument.openFile(path),
      initialPage: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Reader(
              document: path,
            ),
          ),
        );
      },
      onLongPress: () {},
      child: Card(
        child: Container(
          alignment: Alignment.center,
          height: 150,
          width: 120,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                child: PdfView(
                  controller: _controller,
                  documentLoader: CupertinoActivityIndicator(),
                ),
              ),
              // Positioned(
              //   child: Text(
              //     basename(path),
              //     overflow: TextOverflow.ellipsis,
              //     style: TextStyle(
              //       fontSize: 12.0,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              //   top: 0,
              //   left: 0,
              //   right: 0,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
