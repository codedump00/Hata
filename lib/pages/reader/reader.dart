import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Reader extends StatefulWidget {
  final String document;
  Reader({Key key, this.document}) : super(key: key);

  @override
  _ReaderState createState() => _ReaderState(document: document);
}

class _ReaderState extends State<Reader> {
  _ReaderState({this.document});
  final String document;
  PdfController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PdfController(document: PdfDocument.openFile(document));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfView(
        controller: _controller,
        documentLoader: CupertinoActivityIndicator(),
      ),
    );
  }
}
