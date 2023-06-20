import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

/// resim dosyası seçme işlemi ve seçilen dosyanın base64-
/// formatına dönüştürülmesi gibi işlevleri sağlar
Image showBase64Image(String? base64Image) {
  List<int> imageBytes = base64Decode(base64Image!);
  return Image.memory(Uint8List.fromList(imageBytes));
}

Future<String?> pickAndConvertToBase64() async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.image,
  );


  if (result != null) {
    File file = File(result.files.single.path!);

    List<int> fileBytes = await file.readAsBytes();
    String base64Image = base64Encode(fileBytes);

    return base64Image;
  }

  return null;
}

