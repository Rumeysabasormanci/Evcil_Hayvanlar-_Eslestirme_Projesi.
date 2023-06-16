import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../components/bottom.bar.dart';
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Form verilerini kullanarak işlemleri yaptım.
      print('İsim: $_name');
      print('Soyisim: $_surname');
      print('E-mail: $_mail');
      print('Şifre: $_password');
    }
  }

  void selectImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      //File file = File(result.files.single.path);
    } else {
      // User canceled the picker
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
              padding: EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'İsim'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen isminizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _name = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Soyisim'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen Soyisminizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _surname = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'E-mail'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen mailinizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _mail = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Şifre'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen şifrenizi girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value,
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: _submitForm,
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
