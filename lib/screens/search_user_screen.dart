// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_app_1/widgets/text_field.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'register_screen.dart';

class SearchUserScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ຄົ້ນຫາຜູ້ໃຊ້'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image(
                image: AssetImage('assets/images/vector1.png'),
                width: MediaQuery.of(context).size.width * 3 / 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: CustomTextField(
                    controller: _usernameController,
                    labelText: 'ຊື່ຜູ້ໃຊ້',
                    prefixIcon: Icons.search, obscureText: false,),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () async {
                  final username = _usernameController.text.trim();
                  print('Username entered: $username');

                  if (username.isNotEmpty) {
                    final userExists =
                        await Provider.of<UserProvider>(context, listen: false)
                            .searchUser(username);

                    if (userExists) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('User not found'),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Please enter a username'),
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
                      'ຄົ້ນຫາ',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
