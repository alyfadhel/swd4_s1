import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s1/core/layout/news_app/controller/cubit.dart';
import 'package:swd4_s1/core/layout/news_app/controller/state.dart';
import 'package:swd4_s1/features/news/business/presntation/screens/business_screen.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>
      (
      listener: (context, state) {},
      builder: (context, state) {
        var article = NewsCubit.get(context).sports;
        return ConditionalBuilder(
          condition: state is! NewsGetSportsLoadingState,
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
