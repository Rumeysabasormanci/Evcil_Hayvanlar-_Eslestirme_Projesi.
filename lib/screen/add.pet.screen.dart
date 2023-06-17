import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:rumeysa_21070690018_finish_project/hook/navigation.helper.dart';
import 'package:rumeysa_21070690018_finish_project/models/advert.dart';
import '../components/bottom.bar.dart';

class AddPetScreen extends StatefulWidget {
  const AddPetScreen({super.key, required this.title});

  final String title;

  @override
  State<AddPetScreen> createState() => AddPetScreenState();
}

class AddPetScreenState extends State<AddPetScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  int? _age;
  double? _kilo;
  String? _genus;
  String? _gender;
  String? _bio;
  String? _phone;

  void _submitForm(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Form verilerini kullanarak işlemleri yaptım.
      print('İsim: $_name');
      print('Yaş: $_age');
      print('Kilo: $_kilo');
      print('Cins: $_genus');
      print('Cinsiyet: $_gender');
      print('Hakkında: $_bio');

      AdvertItem item = AdvertItem(
        name: _name!,
        age: _age!,
        kilo: _kilo!,
        bio: _bio!,
        genus: _genus!,
        gender: _gender!,
        phone: _phone!,
      );

      await Advert.addAdvert(item);
      goPage(context, 'advert');
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
        appBar: AppBar(title: Text(widget.title)),
        bottomNavigationBar: bottomBar(context),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/addscreen.jpeg'),
                // Resim yolunu güncelleyin
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                        height: 90,
                        width: 90,
                        child: ElevatedButton(
                            onPressed: selectImage,
                            child: const Icon(
                              Icons.image,
                              size: 50,
                            ))),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'İsim'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen bir isim girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _name = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Yaş'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen yaş girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _age = int.tryParse(value!),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Kilo'),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen kilo girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _kilo = double.tryParse(value!),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Cins'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen Cins girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _genus = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Cinsiyet'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen cinsiyet girin.';
                        }
                        return null;
                      },
                      onSaved: (value) => _gender = value,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(labelText: 'Telefon'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen Telefon numarasi giriniz.';
                        }
                        return null;
                      },
                      onSaved: (value) => _phone = value,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Hakkında'),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Lütfen hakkında bir şeyler yazın.';
                        }
                        return null;
                      },
                      onSaved: (value) => _bio = value,
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(
                      height: 50,
                      width: 180,
                      child: ElevatedButton(
                        onPressed: ()=> _submitForm(context),
                        child: Text(
                          'Paylaş',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ))));
  }
}
