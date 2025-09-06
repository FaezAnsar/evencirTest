import 'package:evencir_test/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Center(
                child: Text(
                  'Faez Ansar',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20.h,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Faez Ansar',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'faezansar.business@gmail.com',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '03438717265',
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              _profileItem(
                Image.asset(AppAssets.settingsIcon),
                'Kontoinställningar',
              ),
              const SizedBox(height: 20),
              _profileItem(
                Image.asset(AppAssets.cashIcon),
                'Mina betalmetoder',
              ),
              const SizedBox(height: 20),
              _profileItem(Image.asset(AppAssets.supportIcon), 'Support'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileItem(Widget icon, String label) {
    return Row(
      children: [
        SizedBox(width: 20),
        icon,
        const SizedBox(width: 18),
        Text(
          label,
          style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
