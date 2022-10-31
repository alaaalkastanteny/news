// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m/Cubit/cubit.dart';
import 'package:m/Cubit/states.dart';
import 'package:m/Widgets/articalBuilder.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchContrller,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.search),
                    labelText: 'search',
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Search must not be empty';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    NewsCubit.get(context).getsearch(value);
                  },
                ),
              ),
              Expanded(child: articalBuilder(list, context, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
