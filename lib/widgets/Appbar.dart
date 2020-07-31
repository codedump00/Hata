import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  final List<Widget> actions;
  final Widget title, leading;
  final bool centerTitle;
  const Appbar({
    Key key,
    this.actions,
    this.title,
    this.leading,
    this.centerTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: title,
      elevation: 0,
      leading: leading,
      centerTitle: centerTitle,
    );
  }
}
