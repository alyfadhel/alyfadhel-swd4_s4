import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swd4_s4/core/layout/shop/controller/cubit.dart';
import 'package:swd4_s4/features/shop/home/data/model/categories_home_model.dart';
import 'package:swd4_s4/features/shop/home/data/model/shop_home_model.dart';
import 'package:swd4_s4/features/shop/home/presentation/widgets/build_categories_home.dart';

class BuildItem extends StatelessWidget {
  final ShopHomeModel model;

  const BuildItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          items:
              model.data!.banners
                  .map(
                    (e) => ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: CachedNetworkImage(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: e.image,
                        placeholder:
                            (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: Container(color: Colors.black),
                            ),
                        errorWidget:
                            (context, url, error) => Icon(
                              Icons.error_outline,
                              size: 100.0,
                              color: Colors.grey[300],
                            ),
                      ),
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            height: 250,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(height: 30.0),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: 30.0),
              SizedBox(
                height: 150.0,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder:
                      (context, index) => BuildCategoriesHome(
                        model:
                            ShopCubit.get(
                              context,
                            ).categoriesHomeModel!.data.data[index],
                      ),
                  separatorBuilder: (context, index) => SizedBox(width: 20.0),
                  itemCount:
                      ShopCubit.get(
                        context,
                      ).categoriesHomeModel!.data.data.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 30.0),
              Text(
                'New Products',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

