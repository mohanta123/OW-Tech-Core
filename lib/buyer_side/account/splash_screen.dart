import 'package:flutter/material.dart';
import '../buttonnavigation/button_navigation.dart';
import '../home/home_page.dart';
class Slash_screen extends StatefulWidget {
  const Slash_screen({Key? key}) : super(key: key);
  @override
  State<Slash_screen> createState() => _Slash_screenState();
}
class _Slash_screenState extends State<Slash_screen> {
  void initState() {
    super.initState();
    _navigatehome();
  }
  _navigatehome() async {
    await Future.delayed(Duration(seconds:5), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Button_navigation()));
    //Login()
  }
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Image.asset(
                    "assets/banner/onewholesale_png_3x-removebg-preview.png",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Image.asset("assets/banner/flag_logo.png",height: deviceHeight*0.07,width: deviceWidth*0.2,),
            Text("Appman Technologies",style: TextStyle(fontSize: 22),),
          ],
        ),
      ),
    );
  }
}
