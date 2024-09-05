// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/routes/app_routes.dart';
import 'package:flutter_app_1/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເຂົ້າສູ່ລະບົບ', style: TextStyle(color: Colors.blue[900])),
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
                TextButton(
                  onPressed: () async {
                    final username = _usernameController.text;
                    final password = _passwordController.text;
                    final isLoggedIn =
                        await Provider.of<UserProvider>(context, listen: false)
                            .login(username, password, context);

                    if (isLoggedIn) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Login failed. Please try again.'),
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
                        'ເຂົ້າສູ່ລະບົບ',
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
