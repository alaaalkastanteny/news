import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m/%D9%8Dscreens/search_screen.dart';
import 'package:m/Cubit/cubit.dart';
import 'package:m/Cubit/states.dart';
import 'package:m/Widgets/articalBuilder.dart';
import 'package:m/Widgets/navigateTo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: const Icon(Icons.search)),
                IconButton(
                    onPressed: () {
                      cubit.changeAppMode();
                    },
                    icon: const Icon(Icons.brightness_4_outlined))
              ],
            ),
            body: PageView(
              onPageChanged: (value) {
                cubit.changeBottomNavBar(value);
              },
              controller: pagecontroller,
              allowImplicitScrolling: true,
              children: [
                articalBuilder(NewsCubit.get(context).business, context),
                articalBuilder(NewsCubit.get(context).sports, context),
                articalBuilder(NewsCubit.get(context).science, context),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItem,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                pagecontroller.jumpToPage(index);
              },
            ),
          );
        });
  }
}
