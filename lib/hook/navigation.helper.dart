import 'package:flutter/cupertino.dart';
void goPage(BuildContext context, String page) {
  Navigator.popAndPushNamed(context, '/$page' );
}
