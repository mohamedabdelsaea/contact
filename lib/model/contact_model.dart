import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'contact_model.g.dart';

@HiveType(typeId: 0)
class ContactModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String phone;

  ContactModel({
    required this.name,
    required this.email,
    required this.phone,
  });
}
