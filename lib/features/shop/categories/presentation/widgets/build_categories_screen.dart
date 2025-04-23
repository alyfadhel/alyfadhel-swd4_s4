import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/features/shop/home/data/model/categories_home_model.dart';

class BuildCategoriesScreen extends StatelessWidget {
  final CategoriesHomeDetailsDataModel model;

  const BuildCategoriesScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color:
                  ThemeModeCubit.get(context).isDark
                      ? Colors.grey[300]
                      : Colors.deepOrange,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                    imageUrl: model.image,
                    placeholder:
                        (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(color: Colors.black),
                        ),
                    errorWidget:
                        (context, url, error) => Icon(
                          Icons.error,
                          color: Colors.grey[300],
                          size: 100.0,
                        ),
                  ),
                ),
                SizedBox(width: 20.0),
                SizedBox(
                  width: 125,
                  child: Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
