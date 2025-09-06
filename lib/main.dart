import 'package:evencir_test/configs/app_info.dart';
import 'package:evencir_test/configs/routing/router.dart';
import 'package:evencir_test/configs/service_locator.dart';
import 'package:evencir_test/configs/theme/app_theme.dart';
import 'package:evencir_test/core/cubits/auth/auth_cubit.dart';
import 'package:evencir_test/feature/favorites/favorites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Things to do:

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  // Load .env & initialize dependencies
  // await dotenv.load(fileName: '.env');
  await initializeDependencies();

  // Initialize Stripe through service locator

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Montserrat', 'Montserrat');
    final theme = MaterialTheme(textTheme);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => locator<AuthCubit>()),
          BlocProvider(create: (context) => locator<FavoritesCubit>()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: AppInfo.appName,
          theme: theme.lightMediumContrast(),
          routerConfig: router,
        ),
      ),
    );
  }
}
