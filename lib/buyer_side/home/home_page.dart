// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Text_font_class/text_font_class.dart';
import '../../color/color.dart';
import '../account/login.dart';
import '../basket/basket.dart';
import '../category/grocery_sub_cat.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List imageList = [
    {"id": 1, "image_path": "assets/banner/b1.jpeg"},
    {"id": 2, "image_path": "assets/banner/b2.jpeg"},

    {"id": 3, "image_path": "assets/banner/b5.jpeg"},
    {"id": 4, "image_path": "assets/banner/Banner7.jpg"},

    {"id": 5, "image_path": "assets/banner/Banner3.jpg"},
    {"id": 6, "image_path": "assets/banner/Banner5.png"},
    {"id": 7, "image_path": "assets/banner/Banner8.jpg"},
  ];
  final CarouselController carouselController = CarouselController();
  int currentSlider = 0;

//popular categories
  final List<Map<String, dynamic>> CatItem = [
    {"title": "Atta, Rice & Dal", "images": "assets/banner/ata.png"},
    {
      "title": "Masalas & Spicies",
      "images": "assets/banner/masala-removebg-preview.png"
    },
    {"title": "Oil & Ghee", "images": "assets/banner/oil.png"},
    {
      "title": "Dry Fruits,Nuts & Seeds",
      "images": "assets/banner/dry_fruit-removebg-preview.png"
    },
    {
      "title": "Snacks & Packaged Food",
      "images": "assets/banner/snacks-removebg-preview.png"
    },
    {
      "title": "Noodles & Pasta",
      "images": "assets/banner/noodles-removebg-preview.png"
    },
    {
      "title": "Detergents & Laundry",
      "images": "assets/banner/detergents-removebg-preview.png"
    },
    {
      "title": "Bevrages",
      "images": "assets/banner/bevrage-removebg-preview.png"
    },
    {
      "title": "Body & Skincare",
      "images": "assets/banner/bodycare-removebg-preview.png"
    },
    {
      "title": "Hair Care",
      "images": "assets/banner/hair_care-removebg-preview.png"
    },
    {
      "title": "Baby Care & Wellness",
      "images": "assets/banner/babycare-removebg-preview.png"
    },
    {
      "title": "Oral care",
      "images": 'assets/banner/oralcare-removebg-preview.png'
    },

  ];
  final List<Map<String, dynamic>> newArivalItem = [
    {"title": "Atta, Rice & Dal", "images": "assets/banner/ata.png"},
    {
      "title": "Masalas & Spicies",
      "images": "assets/banner/masala-removebg-preview.png"
    },
    {"title": "Oil & Ghee", "images": "assets/banner/oil.png"},
    {
      "title": "Dry Fruits,Nuts & Seeds",
      "images": "assets/banner/dry_fruit-removebg-preview.png"
    },
    {
      "title": "Snacks & Packaged Food",
      "images": "assets/banner/snacks-removebg-preview.png"
    },
    {
      "title": "Noodles & Pasta",
      "images": "assets/banner/noodles-removebg-preview.png"
    },
    {
      "title": "Detergents & Laundry",
      "images": "assets/banner/detergents-removebg-preview.png"
    },
    {
      "title": "Bevrages",
      "images": "assets/banner/bevrage-removebg-preview.png"
    },
    {
      "title": "Body & Skincare",
      "images": "assets/banner/bodycare-removebg-preview.png"
    },
    {
      "title": "Hair Care",
      "images": "assets/banner/hair_care-removebg-preview.png"
    },
  ];
  ColorSelect colorObj = ColorSelect();
  ///Barnd item
  final List<Map<String, dynamic>> BarndItem = [
    {"title": "Haldiram", "images": "assets/banner/Haldiram's.png"},
    {"title": "Goldmedal", "images": "assets/banner/goldmedal new.png"},
    {"title": "Dabur", "images": "assets/banner/Dabur-Logo.wine-removebg-preview.png"},
    {"title": "Mtr", "images": "assets/banner/MTR.png"},
    {"title": "Crompton", "images": "assets/banner/Crompton-Logo-Vector-removebg-preview.png"},
  ];

  @override
  Widget build(BuildContext context) {
    double mainAxisExtent = MediaQuery.of(context).size.width >= 600 ? 300 : 200;
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Padma Lochan",style: TextFont.bold_TextStyle.copyWith(
                color: Colors.white,
              ),),
              accountEmail: Text("Padmalochan277@gmail.com",style: TextFont.normal_TextStyle.copyWith(
                color: Colors.white,
              ),),
              decoration: BoxDecoration(color: colorObj.pruple),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              title: Text(
                "Home",
                style: TextFont.normal_TextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              leading: Icon(Icons.home, color: colorObj.pruple,),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              title: Text(
                "Account",
                style: TextFont.normal_TextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.account_box,
                color: colorObj.pruple,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Basket(),
                    ));
              },
              title: Text(
                "cart",
                style: TextFont.normal_TextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.shopping_cart,
                color: colorObj.pruple,
              ),
            ),
            ListTile(
              onTap: () {},
              title: Text(
                "Logout",
                style: TextFont.normal_TextStyle.copyWith(
                  color: Colors.black,
                ),
              ),
              leading: Icon(
                Icons.logout,
                color: colorObj.pruple,
              ),
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          leading: Builder(
            builder: (context)=>IconButton(onPressed: (){
              Scaffold.of(context).openDrawer();
            }, icon: Icon(Icons.menu,color: Colors.white,)),
          ),
          //   backgroundColor: Colors.pink,
          centerTitle: true,
          backgroundColor: colorObj.main_colorP,
          title: Text(
            "OW Tech Core",style: TextFont.bold_TextStyle.copyWith(
            color: Colors.white,
          ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.person,color: Colors.white,),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "Search products",
                  prefixIcon: Icon(
                    Icons.search,
                    color: colorObj.pruple,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 1, right: 1, top: 10, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () {
                            print(currentSlider);
                          },
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
                                        fit: BoxFit.fill,
                                        //width: double.infinity,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            carouselController: carouselController,
                            options: CarouselOptions(
                              scrollPhysics: const BouncingScrollPhysics(),
                              autoPlay: true,
                              aspectRatio: 2,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentSlider = index;
                                });
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: imageList.asMap().entries.map(
                              (entry) {
                                print(entry);
                                print(entry.key);
                                return GestureDetector(
                                  onTap: () => carouselController
                                      .animateToPage(entry.key),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          ///SHOP BY CATEGORIES
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: colorObj.main_colorP),
                            width: double.infinity,
                            height: deviceHeight*0.04,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(width: 7,),
                                  Text(
                                    "SHOP BY CATEGORIES",
                                    style: TextFont.bold_TextStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                          mainAxisExtent: 180,
                        ),
                        itemCount: CatItem.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GrocerySubCat(),
                                  ));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, bottom: 10, top: 5),
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "${CatItem.elementAt(index)["images"]}",
                                        width: 110,
                                        height: 100,
                                      ),
                                      Center(
                                        child: Text(
                                          "${CatItem.elementAt(index)["title"]}",
                                          style: TextFont.normal_TextStyle.copyWith(
                                            color: Colors.black,fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ///Shop by brand
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: colorObj.main_colorP),
                height: 45,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "SHOP BY BRANDS",
                        style: TextFont.bold_TextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 150,
                  crossAxisCount: 3,
                ),
                itemCount: BarndItem.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => GrocerySubCat(),
                          ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.black,

                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 10, top: 5),
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "${BarndItem.elementAt(index)["images"]}",
                                width: 110,
                                height: 100,
                              ),
                              Center(
                                child: Text(
                                  "${BarndItem.elementAt(index)["title"]}",
                                  style: TextFont.normal_TextStyle.copyWith(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
