import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swd4_s4/core/layout/news_layout/controller/cubit.dart';
import 'package:swd4_s4/core/layout/news_layout/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/core/shared/widgets/news_widgets/build_article_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var article = NewsCubit.get(context).search;
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
                cubit.searchController.clear();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 900.0,
                child: Column(
                  children: [
                    MyFormField(
                      controller: cubit.searchController,
                      type: TextInputType.text,
                      prefix: Icons.search,
                      text: 'search',
                      style: TextStyle(
                        color: ThemeModeCubit.get(context).isDark ? Colors.black : Colors.white,
                      ),
                      onChanged: (value) {
                        cubit.getSearch(value);
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Expanded(child: BuildArticleItem(article: article, isLoading: true,)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
