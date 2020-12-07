import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height / 3,
      child: Carousel(
        dotSize: 5.0,
        dotSpacing: 20.0,
        indicatorBgPadding: 2.0,
        dotColor: Colors.purpleAccent,
        borderRadius: true,
        autoplay: true,
        onImageTap: (int imageNumber){
          print("Image Number is $imageNumber");
        },
        images: [
          NetworkImage(
              'https://www.iheartradio.ca/image/policy:1.10267552:1574700135/shopping.jpg'),
          NetworkImage(
              'https://review.chinabrands.com/chinabrands/seo/image/20190219/dubaionlineshoppingsites,.png'),
          NetworkImage(
              'https://www.intheblack.com/-/media/intheblack/allimages/magazine-2018/11-november/small-shopping-bags.jpg')
        ],
      ),
    );
  }
}
