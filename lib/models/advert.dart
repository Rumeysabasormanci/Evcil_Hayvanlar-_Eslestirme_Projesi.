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
          bio: item['bio']));
    });
    print(adverts);

    return adverts;
  }

  static void resetAdvert()  async {
      await db.collection('advert').delete();
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

  const AdvertItem({
    required this.name,
    required this.phone,
    required this.age,
    required this.kilo,
    required this.gender,
    required this.genus,
    required this.bio,
  });
}
