import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s4/core/shared/themes/controller/cubit.dart';
import 'package:swd4_s4/features/shop/product_details/data/presentation/screens/product_details_screen.dart';
import 'package:swd4_s4/features/shop/search/data/model/search_model.dart';

class BuildSearchItem extends StatelessWidget {
  final SearchDataDetailsModel model;
  const BuildSearchItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen(id: model.id),));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color:
                ThemeModeCubit.get(context).isDark
                    ? Colors.grey[300]
                    : Colors.deepOrange,
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      height: 150.0,
                      width: 150.0,
                      imageUrl: model.image,
                      placeholder:
                          (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(color: Colors.black),
                      ),
                      errorWidget:
                          (context, url, error) => Icon(
                        Icons.error_outline,
                        size: 100,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 10.0,
                        end: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(
                              fontSize: 16.0,
                              height: 1.2,
                            ),
                          ),
                          Spacer(),
                          Text(
                            model.price.round().toString(),
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: ThemeModeCubit.get(context).isDark ? Colors.blue : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
