import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/hook/file.helper.dart';
import 'package:rumeysa_21070690018_finish_project/hook/navigation.helper.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';
///kart düzenlemeleri
const ts = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
InkWell cardAdvert(BuildContext context, AdvertItem? item) {
  return InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
      debugPrint('Card tapped.');
      Advert.selectedAdvert = item;
      goPage(context, "pet");
    },
    child: Container(
      decoration: const BoxDecoration(
          color: Colors.white54,
          border: Border(bottom: BorderSide(width: 3, color: Colors.black12))),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: (item?.image != null)
                  ? SizedBox(
                      width: 120,
                      height: 120,
                      child: showBase64Image(item?.image),
                    )
                  : const Icon(Icons.image, size: 120)),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ad: ${item?.name}", style: ts),
                const SizedBox(height: 10),
                Text("Yaş: ${item?.age}", style: ts),
                const SizedBox(height: 10),
                Text("Cins: ${item?.genus}", style: ts),
                const SizedBox(height: 10),
                Text("Cinsiyet: ${item?.gender}", style: ts),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}


// Image(image: AssetImage('assets/kopus.jpeg'),  height: 120)),
