import 'package:flutter/material.dart';
import 'package:m/Widgets/navigateTo.dart';
import 'package:m/modle/webview.dart';

// ignore: non_constant_identifier_names
Widget buildArticleItem(Article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(url: Article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${Article['urlToImage']}'),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    const Icon(Icons.image_not_supported_outlined, size: 80);
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${Article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${Article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
