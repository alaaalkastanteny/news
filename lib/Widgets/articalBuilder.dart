import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:m/Widgets/cards.dart';
import 'package:m/Widgets/liner.dart';

Widget articalBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 1,
      builder: (
        BuildContext context,
      ) =>
          ListView.separated(
              itemBuilder: (context, index) =>
                  buildArticleItem(list[index], context),
              separatorBuilder: (context, index) => Liner(),
              itemCount: list.length),
      fallback: (BuildContext context) => isSearch
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );
