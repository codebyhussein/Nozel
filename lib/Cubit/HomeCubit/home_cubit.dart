import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  UserBookedRoms({
    required String name,
    required String Number_of_individuals,
    required String Startin_hotel,
    required String Expiration_date,
  }) async {
    try {
      emit(HomeLoading());
      SharedPreferences pref = await SharedPreferences.getInstance();
      var uid = pref.getString('uid');
      var email = pref.getString('email');
      var documentReference = FirebaseFirestore.instance
          .collection("UsersBookedRooms")
          .doc(email)
          .set({
        'name': name,
        'Number of individuals': Number_of_individuals,
        'Startin_hotel': Startin_hotel,
        'Expiration_date': Expiration_date
      });
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(errorMassege: 'error name:$e '));
    } catch (e) {
      emit(HomeFailure(errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }

  FeedBackMethod({
    required String name,
    required String FeedBackText,
  }) async {
    try {
      emit(HomeLoading());
      SharedPreferences pref = await SharedPreferences.getInstance();

      var email = pref.getString('email');
      var documentReference =
          FirebaseFirestore.instance.collection("FeedBack").doc(email).set({
        'name': name,
        'FeedBackText': FeedBackText,
      });
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(errorMassege: 'error name:$e '));
    } catch (e) {
      emit(HomeFailure(errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }

  OrderMethod(
      {required String nameOfOrder,
      required double price,
      required int count}) async {
    try {
      emit(HomeLoading());
      SharedPreferences pref = await SharedPreferences.getInstance();

      var email = pref.getString('email');
      var documentReference = FirebaseFirestore.instance
          .collection("Order")
          .doc(email)
          .set({'nameOfOrder': nameOfOrder, 'price': price, 'count': count});
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(errorMassege: 'error name:$e '));
    } catch (e) {
      emit(HomeFailure(errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }

  OrderServicesMethod(
      {required String nameOfOrder, required String NameOfCleaning}) async {
    try {
      emit(HomeLoading());
      SharedPreferences pref = await SharedPreferences.getInstance();

      var email = pref.getString('email');
      var documentReference = FirebaseFirestore.instance
          .collection("UserOrderCleaningRoom")
          .doc(email)
          .set({
        'nameOfOrder': nameOfOrder,
        'NameOfCleaning': NameOfCleaning,
      });
      emit(HomeSuccess());
    } catch (e) {
      emit(HomeFailure(errorMassege: 'error name:$e '));
    } catch (e) {
      emit(HomeFailure(errorMassege: 'Somthing went wrong \nPlease try again'));
    }
  }

  changePymentColors1({required Color PymentColor}) {
    emit(HomeChange1());
  }

  changePymentColors2({required Color PymentColor}) {
    emit(HomeChange2());
  }

  List<Map> hotelroomdescriptionSuites = [
    {
      'hotelName': 'Standard Room',
      'description': '''
This is a basic room that usually
comes with a queen or king-sized
bed, a dresser,a desk, and an en..
suite bathroom. It is perfectfor travelers who are looking for a simple and
comfortable place to stay.''',
      'NumberOfHuman': '2',
      'oneNightPrice': '100',
      'More than oneNightPrice': '480',
      'one week price': '1500',
      'More than oneNightPriceChange': '88',
      'one week priceChange': '50'
    },
    {
      'hotelName': 'Deluxe Room',
      'description': '''
A deluxe room is similar to
a standard room but is usually
more spacious and comes with..
added amenities such as a seating area, a minibar,
and a balcony or terrace with a view
of the pool or garden.''',
      'NumberOfHuman': '3',
      'oneNightPrice': '100',
      'More than oneNightPrice': '500',
      'one week price': '1000',
      'More than oneNightPriceChange': '300',
      'one week priceChange': '200'
    },
    {
      'hotelName': 'Superior Room',
      'description': '''
A superior room is a step up
from the deluxe room and usually
comes with more luxurious furnishings..
and amenities such as a jacuzzi tub or a rain shower. It may also
have a separate living area
or a larger balcony.''',
      'NumberOfHuman': '4',
      'oneNightPrice': '99',
      'More than oneNightPrice': '150',
      'one week price': '250',
      'More than oneNightPriceChange': '120',
      'one week priceChange': '100'
    },
    {
      'hotelName': 'Family Room',
      'description': '''
A family room is perfect for families
traveling together as it usually
comes with multipl..
beds or a king-sized bed and a sofa bed. It may also have
a small kitchenette
or dining area for added convenience.
''',
      'NumberOfHuman': '5',
      'oneNightPrice': '60',
      'More than oneNightPrice': '120',
      'one week price': '150',
      'More than oneNightPriceChange': '100',
      'one week priceChange': '99'
    },
    {
      'hotelName': 'Junior Suite',
      'description': '''
A junior suite is a spacious room
that usually comes with a separate
living area and bedroom. It may..
also have a kitchenette or dining area and a private balcony
or terrace with a view.''',
      'NumberOfHuman': '1',
      'oneNightPrice': '30',
      'More than oneNightPrice': '88',
      'one week price': '100',
      'More than oneNightPriceChange': '40',
      'one week priceChange': '60'
    },
    {
      'hotelName': 'Executive Suite',
      'description': '''
An executive suite is a luxurious
room that comes with a separate
bedroom, living area, and dining..
area It may also have a private balcony or terrace with
a view of the city or the Nile River.
''',
      'NumberOfHuman': '3',
      'oneNightPrice': '150',
      'More than oneNightPrice': '100',
      'one week price': '250',
      'More than oneNightPriceChange': '66',
      'one week priceChange': '50'
    },
    {
      'hotelName': 'Royal Suite',
      'description': '''
A royal suite is the most luxurious
room in the hotel and usually comes
with a separate bedroom, living area..
dining area, and a private balcony or terrace with a
view of the city or the Nile River.
It may also have a jacuzzi
tub and other lavish amenities.''',
      'NumberOfHuman': '2',
      'oneNightPrice': '50',
      'More than oneNightPrice': '60',
      'one week price': '100',
      'More than oneNightPriceChange': '40',
      'one week priceChange': '90'
    },
    {
      'hotelName': 'Pool View Room',
      'description': '''
A pool view room is a standard
or deluxe room with a balcony
or terrace that overlooks the hotel's..
pool.It's perfect for travelers who want to be close to the pool
and enjoy the views.''',
      'NumberOfHuman': '5',
      'oneNightPrice': '50',
      'More than oneNightPrice': '100',
      'one week price': '150',
      'More than oneNightPriceChange': '60',
      'one week priceChange': '100'
    },
    {
      'hotelName': 'Garden View Room',
      'description': '''
A garden view room is a standard or
deluxe room with a balcony or
terrace that overlooks..
the hotel's gardens It's perfect for travelers who want a peaceful and
serene environment.''',
      'NumberOfHuman': '4',
      'oneNightPrice': '70',
      'More than oneNightPrice': '120',
      'one week price': '200',
      'More than oneNightPriceChange': '100',
      'one week priceChange': '150'
    },
    {
      'hotelName': 'Nile View Room',
      'description': '''
A Nile view room is a standard
or deluxe room with a balcony or
terrace that overlooks..
the Nile River. It's perfect for travelers who want
to enjoy the beautiful views
of the river from the comfort
of their room.''',
      'NumberOfHuman': '3',
      'oneNightPrice': '60',
      'More than oneNightPrice': '100',
      'one week price': '150',
      'More than oneNightPriceChange': '70',
      'one week priceChange': '70'
    },
  ];
}
