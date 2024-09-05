// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_app_1/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30,
                    right: 0,
                    child: SizedBox(
                      width: 240,
                      child: Image.asset(
                        'assets/images/dokmai.png',
                        fit: BoxFit.cover,
                        color: Color.fromARGB(149, 107, 104, 104),
                        colorBlendMode: BlendMode.srcATop,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: CircleAvatar(
                                    radius: 23,
                                    child: userProvider.profileImageUrl != null
                                        ? ClipOval(
                                            child: Image.network(
                                              userProvider.profileImageUrl!,
                                              width: 46,
                                              height: 46,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Text('No profile image available'),
                                  ),
                                ),
                                Text(
                                  user?.empName ?? 'User',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const Icon(Icons.more_vert_sharp,
                                color: Colors.white, size: 30),
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ຍີນດີຕ້ອນຮັບເຂົ້າສູ່ບໍລິການ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'ຂອງພວກເຮົາ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'ລົງທະບຽນສຳລັບເປີດບັນຊີໃໝ່ດ້ວຍຂັ້ນຕອນທີ່',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'ສະດວກວ່ອງໄວ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/account_form');
                        },
                        child: Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue[900]!,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.person_add_outlined,
                                  size: 35,
                                  color: Colors.blue[900],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "ລູກຄ້າໃໝ່",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/customer');
                        },
                        child: Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue[900]!,
                                        width: 2),
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.person,
                                  size: 35,
                                  color: Colors.blue[900],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "ລູກຄ້າເກົ່າ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900],
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
