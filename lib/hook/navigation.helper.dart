import 'package:flutter/cupertino.dart';
///goPage işlevi, belirtilen bir sayfaya geçmek için Flutter uygulama bağlamını kullanır ve
/// mevcut sayfayı kapatıp ardından yeni sayfaya geçmek için birleşik bir navigasyon işlemi gerçekleştirir.
///Bu, uygulama içinde farklı sayfalar arasında gezinme veya sayfa geçişlerini yönetme için kullanılabilir.
void goPage(BuildContext context, String page) {
  Navigator.popAndPushNamed(context, '/$page' );
}
