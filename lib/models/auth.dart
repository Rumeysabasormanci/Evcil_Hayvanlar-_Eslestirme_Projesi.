import 'package:localstore/localstore.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';

class Auth {
  static final db = Localstore.instance;
  static User? user;

  static Future<bool> login(String _email, String password) async {
    dynamic data = await db.collection('user').doc(_email).get();

    if(_email == 'reset@app.com'){
      Advert.resetAdvert();
    }

    if (data != null && data['password'] == password) {
      if (data['password'] == password) {
        user = User(
            name: data['name'],
            surname: data['surname'],
            password: password,
            email: data['email']);
        return true;
      }
    }
    return false;
  }

  static Future<bool> register(
      String email, String password, String name, String surname) async {
      await db.collection('user').doc(email).set({
        'email': email,
        'password': password,
        'name': name,
        'surname': surname
      });
    return true;
  }
}

class User {
  final String name;
  final String surname;
  final String password;
  final String email;

  const User({
    required this.name,
    required this.surname,
    required this.password,
    required this.email,
  });
}
