import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
  double? _weight;
  String? _genus;
  String? _gender;
  String? _bio;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Form verilerini kullanarak işlemleri yaptım.
      print('İsim: $_name');
      print('Yaş: $_age');
      print('Kilo: $_weight');
      print('Cins: $_genus');
      print('Cinsiyet: $_gender');
      print('Hakkında: $_bio');
    }
  }
   void selectImage () async {
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
        title: Text('pet'),
      ),
        bottomNavigationBar: bottomBar(context),


        body: Container(
    decoration: BoxDecoration(
    image: DecorationImage(

    image: AssetImage('assets/addscreen.jpeg'), // Resim yolunu güncelleyin
    fit: BoxFit.cover,
    ),
    ),

      child: SingleChildScrollView (
      child:Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                  height: 90, width: 90,
                  child: ElevatedButton(onPressed: selectImage,
                      child: Icon(Icons.image,size: 50,))),
              TextFormField(
                decoration: InputDecoration(labelText: 'İsim'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen bir isim girin.';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Yaş'),
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
                decoration: InputDecoration(labelText: 'Kilo'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen kilo girin.';
                  }
                  return null;
                },
                onSaved: (value) => _weight = double.tryParse(value!),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cins'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen Cins girin.';
                  }
                  return null;
                },
                onSaved: (value) => _genus = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cinsiyet'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Lütfen cinsiyet girin.';
                  }
                  return null;
                },
                onSaved: (value) => _gender = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hakkında'),
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
                height: 50, width: 180,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Paylaş',style: TextStyle(fontSize: 20),),
                ),
              ),
            ],
          ),
        ),
      ))));
  }
}

