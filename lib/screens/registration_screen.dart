import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../utils/app_utils.dart';
import '../screens/auth_screen.dart';
import '../controllers/account_controller.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();


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
                  text: 'Назад',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => AppUtils.switchScreen(const AuthScreen(), context),
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
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Почта',
                    ),
                    controller: controllerEmail,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Email must not be empty';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Email entered incorrectly';
                      }
                      return null;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Ник',
                    ),
                    controller: controllerUsername,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Username must not be empty';
                      }
                      if (value.length < 8 || value.length >= 16) {
                        return 'Username must be from 8 to 16 characters';
                      }
                      return null;
                    }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      labelText: 'Пароль',
                    ),
                    controller: controllerPassword,
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Password must not be empty';
                      }
                      if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$').hasMatch(value)) {
                        return 'Password must be from 8 to 16 characters, must contain letters, numbers and special characters';
                      }
                      return null;
                    }),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: SizedBox(
                    height: 30,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 22, 20, 32),
                        shape: const StadiumBorder(),
                        textStyle: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      child: const Text(
                        'Зарегистроваться',
                      ),
                      onPressed: () => AccountController(context: context).createAccount(
                          controllerEmail.text.toLowerCase().trim(), controllerUsername.text.trim(), controllerPassword.text),
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
