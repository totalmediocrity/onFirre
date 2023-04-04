import 'package:flutter/material.dart';

import '../utils/app_utils.dart';
import '../screens/registration_screen.dart';
import '../controllers/account_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  bool _obscureText = true;

  void _togglePasswordVisibility() => setState(() => _obscureText = !_obscureText);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(225, 232, 238, 100),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 15),
        child: GestureDetector(
          child: RichText(
            text: const TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Регистрация',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => AppUtils.switchScreen(const RegistrationScreen(), context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [        
          Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Почта',
                    ),
                    controller: controllerEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
                  child: TextFormField(
                    obscureText: _obscureText,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Пароль',
                      suffixIcon: IconButton(
                        icon: _obscureText ? const Icon(Icons.visibility, color: Colors.black) : const Icon(Icons.visibility_off, color: Colors.white),
                        onPressed: () => _togglePasswordVisibility(),
                      ),
                    ),
                    controller: controllerPassword,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(0, 0, 0, 08),
                        shape: const StadiumBorder(),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      child: const Text(
                        'Войти',
                      ),
                      onPressed: () => AccountController(context: context).signIn(controllerEmail.text.toLowerCase().trim(), controllerPassword.text),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
