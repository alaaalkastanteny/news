// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m/APIs/dio_helper.dart';
import 'package:m/Cubit/states.dart';
import 'package:m/sharedpreferences/shared_preferences.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
  ];

  // List<Widget> Screen = [
  //   BusinessScreen(),
  //    SportsScreen(),
  //   ScinceScreen(),
  // ];
  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) getsports();
    if (index == 2) getscience();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsBusinessLodingState());

    if (business.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'c608bcd3eed64db099494c63c3c951a1'
        },
      ).then((value) {
        business = value.data['articles'];
        print(business[0]['title']);

        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getsports() {
    emit(NewsSportsLodingState());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'c608bcd3eed64db099494c63c3c951a1'
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);

        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  List<dynamic> science = [];
  void getscience() {
    emit(NewsScienceLodingState());

    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'c608bcd3eed64db099494c63c3c951a1'
        },
      ).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);

        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeModeState());
    } else {
      isDark = !isDark;

      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeModeState());
        print(isDark);
      });
    }
  }

  List<dynamic> search = [];
  void getsearch(String value) {
    emit(NewsSearchLodingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {'q': value, 'apiKey': 'c608bcd3eed64db099494c63c3c951a1'},
    ).then((value) {
      search = value.data['articles'];
      print(science[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
