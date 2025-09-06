import 'dart:developer';

import 'package:evencir_test/configs/routing/bottom_nav_tab.dart';
import 'package:evencir_test/configs/routing/routes.dart';
import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/core/constants/app_assets.dart';
import 'package:evencir_test/core/cubits/auth/auth_cubit.dart';
import 'package:evencir_test/core/cubits/auth/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      locator<AuthCubit>().initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) async {
        final authCubit = context.read<AuthCubit>();
        final isFirstTime = authCubit.localStorageClient.isFirstTime.get();
        log('SplashScreen - isFirstTime: $isFirstTime');
        if (isFirstTime == true) {
          await Future.delayed(const Duration(seconds: 2));
          //we can implement onboarding logic here
          context.go(
            Routes.main.withParams({'tab': BottomNavTab.products.toString()}),
          );
        } else {
          await Future.delayed(const Duration(seconds: 1));
          context.go(
            Routes.main.withParams({'tab': BottomNavTab.products.toString()}),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(AppAssets.splashImage, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
