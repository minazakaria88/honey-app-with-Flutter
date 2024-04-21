import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../cubit/home_cubit.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
    required this.cubit,
  });

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration:
        const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
      items: cubit.homeModel!.slider.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              i.image,
              fit: BoxFit.cover,
            );
          },
        );
      }).toList(),
    );
  }
}