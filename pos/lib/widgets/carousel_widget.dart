import 'package:flutter/material.dart';
import 'package:pos/constants/styles.dart';
import 'package:pos/payloads/banner_payload.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _activePage = 0;
  final CarouselController _controller = CarouselController();

  List<BannerPayload> images = [
    BannerPayload(
      imagePath: 'assets/banners/Wide_POS_Banner01.png',
    ),
    BannerPayload(
      imagePath: 'assets/banners/Wide_POS_Banner02.png',
    ),
    BannerPayload(
      imagePath: 'assets/banners/Wide_POS_Banner03.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double contextWidth = MediaQuery.of(context).size.width;
    double contextHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Styles.mainColor,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: _carouselWidget(images),
          ),
          Positioned(
            bottom: 40,
            left: 30,
            right: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: images.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: _activePage == entry.key
                          ? Colors.white
                          : Colors.white24,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'SCREEN SIZE : ${contextWidth.toInt()} x ${contextHeight.toInt()}',
              style: TextStyle(color: Colors.white.withOpacity(0.3)),
            ),
          ),
        ],
      ),
    );
  }

  _carouselWidget(List<BannerPayload> images) {
    return CarouselSlider(
      carouselController: _controller,
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: false,
        autoPlay: true,
        reverse: false,
        viewportFraction: 1,
        aspectRatio: 16 / 9,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (position, reason) {
          setState(() {
            _activePage = position;
          });
        },
        enableInfiniteScroll: true,
      ),
      items: images.map<Widget>((banner) {
        return Builder(
          builder: (BuildContext context) {
            if (banner.imagePath != null || banner.imageUrl != null) {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: banner.imagePath != null
                    ? Image.asset(
                  banner.imagePath!,
                  fit: BoxFit.cover,
                )
                    : Image.network(
                  banner.imagePath!,
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  reverse: true,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 450),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _imageWidget(banner),
                          banner.title != null
                              ? Text(
                            banner.title!,
                            style: TextStyle(
                              color: Styles.colorSecondary,
                              fontSize: 96,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          )
                              : Container(),
                          banner.text != null
                              ? Text(
                            banner.text!,
                            style: TextStyle(
                              color: Styles.colorSecondary,
                              fontSize: 64,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.center,
                          )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      }).toList(),
    );
  }

  _imageWidget(BannerPayload banner) {
    double iconSize = 200;

    Widget imgWidget = Container();

    if (banner.imageUrl != null) {
      imgWidget = Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(banner.imageUrl!),
          ),
        ),
      );
    }

    return SizedBox(
      width: iconSize,
      height: iconSize,
      child: imgWidget,
    );
  }
}
