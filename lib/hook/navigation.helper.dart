import 'package:flutter/cupertino.dart';
void goPage(BuildContext context, String page) {
  Navigator.pushNamed(context, '/$page' );
}
