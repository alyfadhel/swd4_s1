import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s1/core/layout/news_app/controller/cubit.dart';
import 'package:swd4_s1/core/layout/news_app/controller/state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var article = NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder:
              (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) => buildArticle(context, article[index]),
                separatorBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Divider(
                        height: 1.0,
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                itemCount: article.length,
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget buildArticle(context, Map model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Column(
    children: [
      Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: CachedNetworkImage(
              width: 150.0,
              height: 150.0,
              fit: BoxFit.cover,
              imageUrl: model['urlToImage'].toString(),
              placeholder:
                  (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(color: Colors.black),
                  ),
              errorWidget:
                  (context, url, error) =>
                      Icon(Icons.error_outline, size: 100, color: Colors.grey),
            ),
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: SizedBox(
              height: 150.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model['title'].toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 10.0),
                  if(model['description'] != null)
                  Text(
                    model['description'].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  Text(
                    model['publishedAt'].toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
