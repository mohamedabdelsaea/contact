import 'package:flutter/material.dart';
import '../core/app_color.dart';

class ImageCreate extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final VoidCallback onDelete;


  const ImageCreate({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.45,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: AppColor.lastColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _infoRow(
            icon: Icons.drive_file_rename_outline_outlined,
            text: name,
          ),
          _infoRow(
            icon: Icons.email,
            text: email,
          ),
          _infoRow(
            icon: Icons.phone_in_talk,
            text: phone,
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: onDelete,
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.delete, color: Colors.white, size: 25),
                  SizedBox(width: 5),
                  Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget reusable لكل صف بيانات
  Widget _infoRow({
    required IconData icon,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
      child: Row(
        children: [
          Icon(icon, size: 30, color: AppColor.primaryColor),
          const SizedBox(width: 5),
          Expanded(
            child: Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
