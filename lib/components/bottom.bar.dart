import 'package:flutter/material.dart';
import '../hook/navigation.helper.dart';


Container bottomBar (BuildContext context){
  return Container(
    height: 50,
    color: Color(0xffFB94BB),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      ElevatedButton(
          onPressed: () => goPage(context,"login"),
          child: Icon(Icons.login)),
      ElevatedButton(
          onPressed: () => goPage(context,""), child: Icon(Icons.home)),
      ElevatedButton(
          onPressed: () => goPage(context,"advert"),
          child: Icon(Icons.add_box)),
      ElevatedButton(
          onPressed: () => goPage(context, "pet"),
          child: Icon(Icons.account_circle_rounded)),
    ]),
  );
}