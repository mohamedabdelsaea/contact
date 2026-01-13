import 'package:contact/core/app_color.dart';
import 'package:contact/model/bottom_sheet.dart';
import 'package:contact/model/contact_model.dart';
import 'package:contact/model/image_create.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Box<ContactModel> contactBox;

  @override
  void initState() {
    super.initState();
    contactBox = Hive.box<ContactModel>('contactsBox');
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,

      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: contactBox.listenable(),
          builder: (context, Box<ContactModel> box, _) {
            if (box.isEmpty) {
              return Center(
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
              );
            }
        
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: box.length,
              itemBuilder: (context, index) {
                final contact = box.getAt(index)!;
        
                return ImageCreate(
                  name: contact.name,
                  email: contact.email,
                  phone: contact.phone,
                  onDelete: () {
                    contact.delete();
                  },
                  onEdit: () {
                    BottomSheetWidget.show(
                      context,
                      name: contact.name,
                      email: contact.email,
                      phone: contact.phone,
                      onSubmit: (n, e, p) {
                        contact.name = n;
                        contact.email = e;
                        contact.phone = p;
                        contact.save();
                      },
                    );
                  },
                );
              },
              separatorBuilder: (_, __) => const SizedBox(height: 25),
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.lastColor,
        child: Icon(Icons.add, color: AppColor.primaryColor, size: 30),
        onPressed: () {
          BottomSheetWidget.show(
            context,
            onSubmit: (String n, String e, String p) {
              final contact = ContactModel(name: n, email: e, phone: p);
              contactBox.add(contact);
            },
          );
        },
      ),
    );
  }
}
