import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _value = 1;
  List imageList = [
    {"id": 1, "image_path": "assets/banner/productimage-removebg-preview.png"},
    {
      "id": 2,
      "image_path": "assets/banner/productbackimage-removebg-preview.png"
    },
    {
      "id": 3,
      "image_path": "assets/banner/productbackimage-removebg-preview.png"
    },
  ];
  final CarouselController carouselController = CarouselController();
  int currentSlider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery"),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imageList
                .map(
                  (item) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          item["image_path"],
                        ),
                        //  fit: BoxFit.fill,
                        //width: double.infinity,
                      ),
                    ),
                    // child: Image.asset(
                    //   item["image_path"],
                    //   fit: BoxFit.cover,
                    //   width: double.infinity,
                    // ),
                  ),
                )
                .toList(),
            carouselController: carouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              // autoPlay: true,
              aspectRatio: 1.3,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentSlider = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.asMap().entries.map(
                (entry) {
                  print(entry);
                  print(entry.key);
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentSlider == entry.key ? 17 : 7,
                      height: 7.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentSlider == entry.key
                              ? Colors.red
                              : Colors.teal),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
