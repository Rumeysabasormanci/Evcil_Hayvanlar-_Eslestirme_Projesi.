  import 'package:flutter/material.dart';
  import 'package:rumeysa_21070690018_finish_project/models/auth.dart';
  import '../hook/navigation.helper.dart';

  class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key, required this.title});

    final String title;

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {
    late String _username;
    late String _password;
    String? _errorMessage; // Changed to nullable String

    void onLogin(context) async{
      var login = await Auth.login(_username, _password);
      if(login){
        goPage(context, 'home');
      }else {
        setState(() {
          _errorMessage = 'Email Ya da şifre hatalı';
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Giriş Yap'),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'E-posta',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Parola',
                    errorText: _errorMessage,

                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => onLogin(context),
                      child: const Text('Giriş Yap'),
                    ),
                    ElevatedButton(
                      child: const Text(
                        'Kayıt Ol',
                      ),
                      onPressed: () => goPage(context, "register"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
