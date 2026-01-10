import 'dart:developer';

import 'package:contact/core/app_color.dart';
import 'package:contact/model/bottom_sheet.dart';
import 'package:contact/model/image_create.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hasContact = false;

  String name = '';
  String email = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,

      body: hasContact == false
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/home.png',
                    width: size.width * 0.6,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'There is No Contacts Added Here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ImageCreate(
                    name: name,
                    email: email,
                    phone: phone,
                    onDelete: () {
                      setState(() {
                        hasContact = false;
                      });
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: 100,
              ),

              //
            ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.lastColor,
        child: Icon(Icons.add, color: AppColor.primaryColor, size: 30),
        onPressed: () {
          BottomSheetWidget.show(
            context,
            onSubmit: (String n, String e, String p) {
              log(n);
              log(e);
              log(p);

              setState(() {
                name = n;
                email = e;
                phone = p;
                hasContact = true;
              });
            },
          );
        },
      ),
    );
  }
}
