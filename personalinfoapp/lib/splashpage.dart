import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:personalinfoapp/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final controller = CarouselController();
void main() {
  runApp(SplashPage());
}

class SplashPage extends StatefulWidget {
  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool changeButton = false;
  int activeIndex = 0;

  final images = [
    "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM.jpeg",
    "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM(1).jpeg",
    "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM(2).jpeg",
    "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM(3).jpeg",
    "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM(4).jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.amberAccent,
      child: Column(children: [
        AppBar(
          title: Text(
            "my profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
        ),
        Column(children: [
          const SizedBox(
            height: 40.0,
          ),
          // Image.asset(
          //   "assets/images/WhatsApp Image 2023-08-16 at 10.47.07 PM.jpeg",
          // )
          CarouselSlider.builder(
            carouselController: controller,
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index, reason) =>
                  setState(() => activeIndex = index),
            ),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final image = images[index];

              return buildImage(image, index);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          buildIndicator(),

          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              setState(() {
                changeButton = true;
              });
              await Future.delayed(Duration(seconds: 1));
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
              setState(() {
                changeButton = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 50,
              width: changeButton ? 50 : 150,
              child: Center(
                child: changeButton
                    ? Icon(Icons.thumb_up)
                    : Text(
                        "View Profile",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 15)),
            ),
          )
        ])
      ]),
    );
  }

  Widget buildImage(String image, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        activeIndex: activeIndex,
        count: images.length,
        effect: ExpandingDotsEffect(),
      );
}

void animateToSlide(int index) => controller.animateToPage(index);
