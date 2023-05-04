import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/style/colors.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../Cubit/HomeCubit/home_cubit.dart';
import '../../core/global.dart';
import '../widgets/DefultButtom.dart';
import '../widgets/DefultTextFormField.dart';
import '../home/homeScreen.dart';

class userBookedBody extends StatelessWidget {
  userBookedBody({super.key});
  String? name;
  String? Number_of_individuals;

  String? security_code;
  bool isLoading = false;
  Color PymentColor1 = Colors.white;
  Color PymentColor2 = Colors.white;

  final formKey = GlobalKey<FormState>();
  var Startin_hotel = TextEditingController();
  var Expiration_date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/signIn.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is HomeChange1) {
              PymentColor1 = Colors.transparent;
            }
            if (state is HomeChange2) {
              PymentColor2 = Colors.transparent;
            }
            if (state is HomeLoading) {
              isLoading = true;
            } else if (state is HomeSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
              isLoading = false;
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  duration: Duration(milliseconds: 1000),
                  content: Text(
                    'Enjoy in Nozel hotel ',
                    style: TextStyle(color: Colors.white),
                  )));
            } else if (state is HomeFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMassege)));
              isLoading = false;
            }
          },
          builder: (context, state) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                ModalProgressHUD(
                  inAsyncCall: isLoading,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Please fill the form',
                          style: TextStyle(
                              fontSize: 30,
                              color: textColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 60.0,
                        ),
                        const Text(
                          'Enter your Name',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 216, 214, 214),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        DefultTextFormField(
                          text: 'Name',
                          iconDatapre: Icons.person,
                          keyboardType: TextInputType.text,
                          ispassword: false,
                          TextLabel: 'Enter your Name',
                          message: 'Please Enter your Name',
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Number of individuals',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 216, 214, 214),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        DefultTextFormField(
                          text: 'Number of individuals',
                          iconDatapre: Icons.numbers,
                          keyboardType: TextInputType.number,
                          ispassword: false,
                          TextLabel: 'Enter your Number of individuals',
                          message: 'Please Enter Number of individuals',
                          onChanged: (value) {
                            Number_of_individuals = value;
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'start in a hotel',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 216, 214, 214),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 343,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: textformfield,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter date of the First day you start in a hotel ';
                              }
                              return null;
                            },
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-11-11'))
                                  .then((value) => {
                                        Startin_hotel.text =
                                            DateFormat.yMMMEd().format(value!)
                                      });
                            },
                            controller: Startin_hotel,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: textColor),
                                hintText: 'What day do you start in a hotel',
                                labelText: 'MM/YY',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                prefixIcon: const Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.white)),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          'Expiration_date',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 216, 214, 214),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          width: 343,
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: textformfield,
                              borderRadius: BorderRadius.circular(20)),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter The date of the day you Leave a hotel ';
                              }
                              return null;
                            },
                            onTap: () {
                              showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-11-11'))
                                  .then((value) => {
                                        Expiration_date.text =
                                            DateFormat.yMMMEd().format(value!)
                                      });
                            },
                            controller: Expiration_date,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                labelStyle: TextStyle(color: textColor),
                                hintText:
                                    'The date of the day you Leave a hotel ',
                                labelText: 'MM/YY',
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  BlocProvider.of<HomeCubit>(context)
                                      .changePymentColors1(
                                          PymentColor: PymentColor1);
                                },
                                child: Text(
                                  'payment now',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: PymentColor1,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await BlocProvider.of<HomeCubit>(context)
                                      .changePymentColors2(
                                          PymentColor: PymentColor2);
                                },
                                child: Text(
                                  'payment in the hotel',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: PymentColor2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        DafultButtom(
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              await BlocProvider.of<HomeCubit>(context)
                                  .UserBookedRoms(
                                name: name!,
                                Number_of_individuals: Number_of_individuals!,
                                Expiration_date: Expiration_date.text,
                                Startin_hotel: Startin_hotel.text,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              );
                            }
                          },
                          text: 'Confirm',
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
