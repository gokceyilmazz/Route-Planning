import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routeplanning/GradientButton.dart';
import '../MainBackground.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  bool _showPassword = true;

  _builtLoginPage() => SafeArea(
        child: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/logo.svg",
                    // width: 200,
                    height: 180,
                    // fit: BoxFit.scaleDown,
                  ),
                  const Text(
                    "Rota Oluşturma & Takip Etme",
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 60),
                  Container(
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        hintText: "Kullanıcı adı",
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () =>
                              setState(() => _showPassword = !_showPassword),
                        ),
                        hintText: "Şifre",
                      ),
                      obscureText: _showPassword,
                    ),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  GradientButton(
                    text: "Giriş Yap",
                    color: const <Color>[
                      Color(0xFF062880),
                      Color(0xFF03ACAD),
                      Color(0xFF2EE2B3),
                    ],
                    onPressed: () {
                      Navigator.pushNamed(context, "/userpage");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            const MainBackground(),
            _builtLoginPage(),
          ],
        ),
      ),
    );
  }
}
