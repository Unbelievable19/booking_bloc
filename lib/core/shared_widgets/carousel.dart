import 'dart:math';

import 'package:booking_bloc/extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key, required this.imageUrls});
  final List<String> imageUrls;
  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentPosition = 0;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: CarouselSlider(
            carouselController: _controller,
            items: widget.imageUrls.map((url) {
              return CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: url,
              );
            }).toList(),
            options: CarouselOptions(
              viewportFraction: 1,
              aspectRatio: 5 / 4,
              //height: context.adaptiveWidth * 0.66,
              onPageChanged: (index, _) {
                setState(() {
                  _currentPosition = index;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: widget.imageUrls.asMap().entries.map((entry) {
                  // final lerpFactor = _getLerpFactor(
                  //     _currentPosition, entry.key, widget.imageUrls.length);
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5, horizontal: 2.5),
                    child: CircleAvatar(
                      radius: 3.5,
                      backgroundColor: entry.key == _currentPosition
                          ? Colors.black
                          : Color.lerp(Colors.black, Colors.white, 0.75),
                    ),
                  );
                }).toList()),
          ),
        )
      ],
    );
  }
}

@Deprecated('Constant color looks better')
// ignore: unused_element
double _getLerpFactor(int currentPosition, int entryKey, int length) {
  final lerpFactor =
      sqrt(((currentPosition - entryKey).toDouble() / length).abs());

  return lerpFactor;
}
