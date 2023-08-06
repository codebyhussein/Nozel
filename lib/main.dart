import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_app/core/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Cubit/HomeCubit/home_cubit.dart';
import 'Cubit/LoginCubit/login_cubit.dart';
import 'Cubit/RegisterCubit/register_cubit.dart';
import 'core/style/colors.dart';
import 'firebase_options.dart';
import 'features/splash/splashScreen.dart';
import 'features/welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  final uid = pref.getString('uid');
  final email = pref.getString('email');
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Widget? widget;

  if (uid != null || email != null) {
    widget = const SplashScreens();
  }
  if (uid == null || email == null) {
    widget = const WelcomeScreen();
  }
  DefultNotification.CreateNotifition();
  runApp(MyApp(startWidget: widget!));
}

class MyApp extends StatefulWidget {
  MyApp({super.key, required this.startWidget});
  Widget startWidget;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    DefultNotification.notificationMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: mainColor,
            ),
            home: widget.startWidget,
          );
        },
      ),
    );
  }
}
