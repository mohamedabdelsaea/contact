import 'package:contact/core/app_color.dart';
import 'package:contact/main.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget {
  static void show(
    BuildContext context, {
    required Function(String name, String email, String phone) onSubmit,
  }) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: AppColor.primaryColor,
      builder: (context) {
        final nameController = TextEditingController();
        final emailController = TextEditingController();
        final phoneController = TextEditingController();
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColor.lastColor,
                  ),
                  child: Image.asset('assets/images/image.png'),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  cursorColor: AppColor.lastColor,
                  style: TextStyle(
                    color: AppColor.lastColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor.lastColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor.lastColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  cursorColor: AppColor.lastColor,
                  style: TextStyle(
                    color: AppColor.lastColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter Your E mail',
                    hintStyle: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor.lastColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor.lastColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLength: 11,
                  controller: phoneController,
                  cursorColor: AppColor.lastColor,
                  style: TextStyle(
                    color: AppColor.lastColor,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Phone',
                    hintStyle: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor.lastColor,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: AppColor.lastColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    onSubmit(
                      nameController.text,
                      emailController.text,
                      phoneController.text,
                    );
                    navigatorKey.currentState!.pop();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColor.lastColor,
                    alignment: Alignment.center,
                    minimumSize: Size(double.infinity, 2),
                  ),
                  child: Text(
                    'Enter User',
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
