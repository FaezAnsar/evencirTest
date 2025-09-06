import 'package:evencir_test/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20.0.h),
          ListTile(
            onTap: () {},
            title: Text('Muzammil Rizwan', style: AppTextStyles.textStyle16),
            subtitle: const Text('versiani.muzammil@gmail.com'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.person),
            title: const Text('About'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.contact_phone),
            title: const Text('Contact us'),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.support_agent),
            title: const Text('Technical support'),
          ),
        ],
      ),
    );
  }
}
