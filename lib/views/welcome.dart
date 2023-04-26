import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../core/global.dart';
import 'auth/login_view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/SplashScreen.png"),
                fit: BoxFit.cover,

              ),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 350,
                        child: Stack(
                          children: [
                            AppLogo(hight: 290),
                            Positioned(
                              top: 240,
                              child: Text(
                                'The Nozel Hotel is a \n luxurious and elegant destination\n for travelers seeking comfort\n and style. With its prime\n location and stunning views',
                                style:
                                    TextStyle(fontSize: 16, color: textColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 282),
                        child: Container(
                          child: MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              },
                              child: Image.asset('images/next.png')),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
      )),
    );
  }
}
