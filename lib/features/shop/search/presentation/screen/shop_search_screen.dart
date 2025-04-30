import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/core/layout/shop/controller/state.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/core/shared/widgets/my_form_field.dart';
import 'package:swd4_s4/features/shop/product_details/data/presentation/screens/product_details_screen.dart';
import 'package:swd4_s4/features/shop/search/data/model/search_model.dart';
import 'package:swd4_s4/features/shop/search/presentation/widgets/build_search_item.dart';

class ShopSearchScreen extends StatelessWidget {
  final bool isSearch;

  const ShopSearchScreen({super.key, this.isSearch = true});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
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
            child: Column(
              children: [
                MyFormField(
                  controller: cubit.searchController,
                  type: TextInputType.text,
                  prefix: Icons.search,
                  text: 'search',
                  onChanged: (value) {
                    cubit.getSearch(text: value);
                  },
                ),
                Expanded(
                  child: ConditionalBuilder(
                    condition: cubit.searchModel != null,
                    builder:
                        (context) => ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder:
                              (context, index) => BuildSearchItem(
                                model:
                                cubit.searchModel!.data!.data[index],
                              ),
                          separatorBuilder:
                              (context, index) => SizedBox(height: 10),
                          itemCount: cubit.searchModel!.data!.data.length,
                        ),
                    fallback:
                        (context) =>
                            isSearch
                                ? Container()
                                : Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
