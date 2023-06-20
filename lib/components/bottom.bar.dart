import 'package:flutter/material.dart';
import '../hook/navigation.helper.dart';
import 'package:line_icons/line_icons.dart';
///burada butonlara basıldığında sayfa yönlendirmesi gerçekleşiyor
Container bottomBar(BuildContext context) {
  return Container(
    height: 55,
    color: const Color(0xffFB94BB),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      ElevatedButton(
          onPressed: () => goPage(context, "home"),
          child: const Icon(LineIcons.home)),
      ElevatedButton(
          onPressed: () => goPage(context, "advert"),
          child: const Icon(LineIcons.paw)),
      ElevatedButton(
          onPressed: () => goPage(context, "add"),
          child: const Icon(LineIcons.plusCircle)),
      ElevatedButton(
          onPressed: () => goPage(context, "profile"),
          child: const Icon(LineIcons.user)),
    ]),
  );
}

