import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/features/shop/favorites/data/model/favorites_model.dart';

class BuildFavoritesScreen extends StatelessWidget {
  final FavoritesProductModel model;
  const BuildFavoritesScreen({super.key, required this.model});

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
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: CachedNetworkImage(
                    height: 150.0,
                    width: 150.0,
                    fit: BoxFit.cover,
                    imageUrl:
                    model.image,
                    placeholder:
                        (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(color: Colors.black),
                    ),
                    errorWidget:
                        (context, url, error) =>
                        Icon(Icons.error, color: Colors.grey[300], size: 100.0),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 150.0,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            model.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.copyWith(color: Colors.black),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                model.price.round().toString(),
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(color: Colors.blue),
                              ),
                              SizedBox(width: 10),
                              Text(
                                model.oldPrice.round().toString(),
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall!.copyWith(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 1.5,
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ShopCubit.get(context).changeFavorites(model.id);
                                },
                                icon: CircleAvatar(
                                  radius: 14.0,
                                  backgroundColor: ShopCubit.get(context).favorites[model.id] == true ?  Colors.blue : Colors.grey,
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 14.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
