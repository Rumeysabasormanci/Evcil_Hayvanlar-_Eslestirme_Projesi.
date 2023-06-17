import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';
import '../components/bottom.bar.dart';
import 'package:url_launcher/url_launcher.dart';

class petInfoScreen extends StatefulWidget {
  const petInfoScreen({super.key, required this.title});
  final String title;

  @override
  State<petInfoScreen> createState() => _petInfoScreenState();
}

Future<void> _launchPhoneCall(String? phoneNumber) async {
  print(phoneNumber);

  var url = Uri(host: phoneNumber, scheme: 'tel');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Arama başlatılamadı: $url';
  }
}

class _petInfoScreenState extends State<petInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
                image: AssetImage('assets/kopus.jpeg'),
                height: 250,
                fit: BoxFit.cover),
            const Center(
              child: Text(
                "ALEX",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "BİLGİLER",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    "Yaş: ${Advert.selectedAdvert?.name}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Kilo: ${Advert.selectedAdvert?.kilo}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Cins: ${Advert.selectedAdvert?.genus}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Cinsiyet: ${Advert.selectedAdvert?.gender}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "Hakkında: ${Advert.selectedAdvert?.bio}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _launchPhoneCall(Advert.selectedAdvert?.phone);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const SizedBox(
                        width: 150,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone, size: 25, color: Colors.black),
                            Text(
                              "İLETİŞİM",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar: bottomBar(context));
  }
}
