// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    String depName = user?.depName ?? '';
    List<String> parts = depName.split('(');
    String laotianPart = parts[0].trim();
    String englishPart =
        parts.length > 1 ? parts[1].replaceAll(')', '').trim() : '';

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.blue[900]),
        child: Column(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                      icon: Icon(Icons.arrow_back_outlined,
                          size: 28, color: Colors.white)),
                  IconButton(
                      onPressed: () async {
                        final userProvider =
                        Provider.of<UserProvider>(context, listen: false);
                        await userProvider.logoutDialog(context);
                      },
                      icon: Icon(Icons.logout_outlined,
                          size: 28, color: Colors.white)),
                ],
              ),
            ),
            // SizedBox(height: 5),
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey[200],
              child: userProvider.profileImageUrl != null
                  ? ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/placeholder_image.png',
                        image: userProvider.profileImageUrl!,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Text('No profile image available'),
            ),
            SizedBox(height: 25),
            Text(user?.empName ?? 'Null',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(laotianPart,
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  Text(englishPart,
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 25),
            Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'ຂໍ້ມູນສ່ວນຕົວ',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('MOBILE'),
                                    Text(
                                      user?.mobile.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('POSITION'),
                                    Text(
                                      user?.position.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('BRANCH CODE'),
                                    Text(
                                      user?.branchCode.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('BRANCH NAME'),
                                    Text(
                                      user?.branchName.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('DEPARTMENT CODE'),
                                    Text(
                                      user?.depCode.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('EMAIL'),
                                    Text(
                                      user?.email.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('BIRTHDAY'),
                                    Text(
                                      user?.birthday.toString() ?? '',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ))
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
