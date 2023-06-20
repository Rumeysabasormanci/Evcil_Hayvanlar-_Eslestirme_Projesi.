import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/hook/navigation.helper.dart';
import 'package:rumeysa_21070690018_finish_project/models/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});
  final String title;
  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _surname;
  String? _mail;
  String? _password;

  void submitForm(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Form verilerini kullanarak işlemleri yaptım.
      print('İsim: $_name');
      print('Soyisim: $_surname');
      print('E-mail: $_mail');
      print('Şifre: $_password');

      var registerUser =
          await Auth.register(_mail!, _password!, _name!, _surname!);
      if (registerUser) {
        goPage(context, 'home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/login5.jpeg'), // Resim yolu
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'İsim'),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen isminizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _name = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Soyisim'),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen Soyisminizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _surname = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen E-Mailin girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _mail = value,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(labelText: 'Şifre'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen şifrenizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value,
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () => submitForm(context),
                        child: const Text(
                          'Kayıt Ol',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
