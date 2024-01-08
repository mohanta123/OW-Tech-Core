import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../color/color.dart';


class ProductDescription extends StatefulWidget {
  const ProductDescription({Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}
class _ProductDescriptionState extends State<ProductDescription> {
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
  ColorSelect colorObj = ColorSelect();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        centerTitle: true,
        backgroundColor: colorObj.pruple,
        title: Text("OW Tech Core",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                    left: 10,
                    right: 10,
                  ),
                  child: CarouselSlider(
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
                ),
                const SizedBox(
                  height: 40,
                ),
                Text("ASHIRVAAD Atta with MultiGrains (1 kg)"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "MRP ₹67",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Free Delivery on Order over ₹599"),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                          value: 1,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                      Text(
                        "₹ 67",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 240,
                      ),
                      Text(
                        "1 Kg",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.5),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      Radio(
                          value: 2,
                          groupValue: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value!;
                            });
                          }),
                      Text(
                        "₹ 296",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      SizedBox(
                        width: 237,
                      ),
                      Text(
                        "5 Kg",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.5),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 320,
          left: 150,
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
      ]),
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 160,
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Add To cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            SizedBox(width: 20,),
            Container(
              width: 180,
              alignment: Alignment.center,
              color: Colors.red,
              child: Text("BUY NOW",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white)),
            ),
          ],
        ),
      ),

    );
  }
}
