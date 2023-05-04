import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Cubit/HomeCubit/home_cubit.dart';
import '../../widgets/DefultButtominHome.dart';
import '../menuScreen.dart';

class cleaningScreenBody extends StatelessWidget {
  const cleaningScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Image.asset(
                  'images/logoClean.png',
                  height: 220,
                  width: double.infinity,
                ),
                Positioned(
                  left: 10,
                  top: 70,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MenuScreen()),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/cleaning.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                    bottom: 10,
                    left: 100,
                    child: Text(
                      'Cleaning room',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50),
              child: Text(
                'You can order unlimited cleaning service for free',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DefultButtomInHomePage(
              text: 'Order now',
              ontap: () async {
                await BlocProvider.of<HomeCubit>(context).OrderServicesMethod(
                    nameOfOrder: "I need cleaning room please",
                    NameOfCleaning: "Cleaning Room");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    '''
"Hello! Our housekeeping team is currently cleaning
your room. We appreciate your patience and
understanding while they work to make sure
your stay is as comfortable as possible.
Thank you for your cooperation."
"Watting..."
''',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  duration: Duration(seconds: 4),
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
