import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/hook/navigation.helper.dart';

const ts= TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
InkWell cardAdvert (BuildContext context,String name, int age, String type, String sex ){

  return InkWell(
    splashColor: Colors.blue.withAlpha(30),
    onTap: () {
      debugPrint('Card tapped.');
      goPage(context, "pet");
    },
    child: Container(
      decoration: const BoxDecoration(color: Colors.white54,
          border: Border(bottom: BorderSide(width: 3, color: Colors.black12))
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10),
              child:Image(image: AssetImage('assets/kopus.jpeg'),  height: 120) ),

          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ad: $name", style: ts),
                SizedBox(height: 10),
                Text("Yaş: $age", style: ts),
                SizedBox(height: 10),
                Text("Cins: $type", style: ts),
                SizedBox(height: 10),
                Text("Cinsiyet: $sex", style: ts),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}