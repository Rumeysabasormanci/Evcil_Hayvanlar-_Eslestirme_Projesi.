import 'package:localstore/localstore.dart';
import 'package:rumeysa_21070690018_finish_project/models/auth.dart';

class Advert {
  static final db = Localstore.instance;
  static AdvertItem? selectedAdvert;
  static Future<bool> addAdvert(AdvertItem item) async {
    // gets new id
    final id = db.collection('advert').doc().id;
    // save the item
    db.collection('advert').doc(id).set({
      "email": Auth.user?.email,
      "name": item?.name,
      "age": item?.age,
      "kilo": item?.kilo,
      "gender": item?.gender,
      "genus": item?.genus,
      "bio": item?.bio,
      "phone": item?.phone,
      "image": item?.image,
    });
    return true;
  }

  static Future<List<AdvertItem>> getAdverts() async {
    final querySnapshot = await db.collection('advert').get();
    final List<AdvertItem> adverts = [];

    querySnapshot?.values.toList().forEach((item) {
      adverts.add(AdvertItem(
          name: item['name'],
          age: item['age'],
          kilo: item['kilo'],
          gender: item['gender'],
          phone: item['phone'],
          genus: item['genus'],
          image: item['image'],
          bio: item['bio']));
    });
    print(adverts);

    return adverts;
  }

  static void resetAdvert()  async {
      await db.collection('advert').delete();

      // example data
     await db.collection('advert').doc().set({"name": "Alex", "age": 2, "kilo": 5.0, "gender": "Erkek",   "phone": "0555", "genus": "Rottweiler", "bio": "Çok uysaldır Aynı cins eş arıyorum", "image": DefaultImages.defImage1});
      await db.collection('advert').doc().set({"name": "Pamuk", "age": 3, "kilo": 7.0, "gender": "Dişi",    "phone": "0555", "genus": "Van Kedisi", "bio": "safkan es arıyorum", "image": DefaultImages.defImage5});
     await db.collection('advert').doc().set({"name": "Milo", "age": 2, "kilo": 8.5, "gender": "Erkek",   "phone": "0555", "genus": "Sibirya Kurdu", "bio": "-", "image": DefaultImages.defImage3});
     await db.collection('advert').doc().set({"name": "Duman", "age": 5, "kilo": 6.0, "gender": "Erkek",  "phone": "0555", "genus": "Doberman", "bio": "Eş Arıyorum", "image": DefaultImages.defImage4});
     await db.collection('advert').doc().set({"name": "Erik", "age": 4, "kilo": 4.5, "gender": "Dişi",    "phone": "0555", "genus": "Sokak Kedisi", "bio": "cins es arıyorum", "image": null});


  }
}

class AdvertItem {
  final String? name;
  final String? phone;
  final int? age;
  final double? kilo;
  final String? gender;
  final String? genus;
  final String? bio;
  final String? image;

  const AdvertItem({
    required this.name,
    required this.phone,
    required this.age,
    required this.kilo,
    required this.gender,
    required this.genus,
    required this.bio,
    required this.image,
  });
}
