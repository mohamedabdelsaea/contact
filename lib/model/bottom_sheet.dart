import 'package:contact/core/app_color.dart';
import 'package:contact/main.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget {
  static void show(
      BuildContext context, {
        String name = '',
        String email = '',
        String phone = '',
        required Function(String, String, String) onSubmit,
      }) {
    final formKey = GlobalKey<FormState>();

    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);
    final phoneController = TextEditingController(text: phone);

    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: AppColor.primaryColor,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              10,
              20,
              10,
              MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.lastColor,
                      ),
                      child: Image.asset('assets/images/image.png'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: nameController,
                    cursorColor: AppColor.lastColor,
                    style: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                    decoration: _inputDecoration('Enter Your Name'),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: emailController,
                    cursorColor: AppColor.lastColor,
                    style: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Email is required';
                      }
                      if (!value.contains('@')) {
                        return 'Enter valid email';
                      }
                      return null;
                    },
                    decoration: _inputDecoration('Enter Your Email'),
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: phoneController,
                    maxLength: 11,
                    keyboardType: TextInputType.phone,
                    cursorColor: AppColor.lastColor,
                    style: TextStyle(
                      color: AppColor.lastColor,
                      fontWeight: FontWeight.w600,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Phone is required';
                      }
                      if (value.length != 11) {
                        return 'Phone must be 11 digits';
                      }
                      return null;
                    },
                    decoration: _inputDecoration('Enter Your Phone'),
                  ),

                  const SizedBox(height: 20),

                  TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        onSubmit(
                          nameController.text.trim(),
                          emailController.text.trim(),
                          phoneController.text.trim(),
                        );
                        navigatorKey.currentState!.pop();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.lastColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Enter User',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(
        color: AppColor.lastColor,
        fontWeight: FontWeight.w600,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColor.lastColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColor.lastColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
