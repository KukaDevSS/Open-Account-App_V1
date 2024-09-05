// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/user_provider.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ລົງທະບຽນຜູ້ໃຊ້'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image(
                  image: AssetImage('assets/images/vector1.png'),
                  width: MediaQuery.of(context).size.width * 3 / 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      controller: _usernameController,
                      labelText: 'ຊື່ຜູ້ໃຊ້',
                      prefixIcon: Icons.person,
                      obscureText: false,
                      isPassword: false),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomTextField(
                      controller: _passwordController,
                      labelText: 'ລະຫັດຜ່ານ',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                      isPassword: true),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('If you already have an account, please', style: TextStyle(fontSize: 14),),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () async {
                    final password = _passwordController.text;
                    final username = _usernameController.text;
                    final isRegistered =
                        await Provider.of<UserProvider>(context, listen: false)
                            .register(username, password);

                    if (isRegistered) {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isRegistered', true);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Register failed'),
                      ));
                    }
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 14),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(
                        'ລົງທະບຽນ',
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
