import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({Key? key}) : super(key: key);

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  List<Map<String, dynamic>> listOfImages = [
    {'id': 1, 'path': 'assets/cake.jpg'},
    {'id': 2, 'path': 'assets/donuts.jpg'},
    {'id': 3, 'path': 'assets/layred.jpg'},
  ];
  final CarouselController _carouselController = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
      child: CarouselSlider(
        items: listOfImages
            .map((e) => Image.asset(
                  e['path'],
                  fit: BoxFit.fill,
                  width: double.infinity,
                ))
            .toList(),
        carouselController: _carouselController,
        options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            scrollDirection: Axis.horizontal,
            scrollPhysics: const BouncingScrollPhysics(),
            aspectRatio: 2,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            }),
      ),
    );
  }
}
