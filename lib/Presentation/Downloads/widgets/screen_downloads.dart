import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/Widgets/app_bar_widget.dart';
import 'package:netflix_ui/core/colors/colors.dart';
import 'package:netflix_ui/core/constants.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final _widgets = [
    const _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          child: AppBarWidget(title: 'Downloads'),
          preferredSize: Size.fromHeight(50)),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemBuilder: (ctx, index) => _widgets[index],
          separatorBuilder: (ctx, index) => SizedBox(
            height: 20,
          ),
          itemCount: _widgets.length,
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    'http://www.themoviedb.org/t/p/w600_and_h900_bestv2/jyzhNSNq28ymUHouNNshEghVqAy.jpg',
    'http://www.themoviedb.org/t/p/w600_and_h900_bestv2/4hqtjslVCaDVgblg7iCtGIy7exO.jpg',
    'http://www.themoviedb.org/t/p/w600_and_h900_bestv2/zvGTZYDCoMSMIBkXExxRxLYimqN.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We will download a personalised selection of \n movies and shows for you, so there is  \n always is something to  watch in your \ndevice',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * 0.35,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                ),
              ),
              DownloadsImageWidth(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 150, top: 50),
                angle: 20,
                size: Size(size.width * 0.45, size.width * 0.45),
                borderRadius: 20,
              ),
              DownloadsImageWidth(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 140, top: 50),
                angle: -10,
                borderRadius: 15,
                size: Size(size.width * 0.45, size.width * 0.45),
              ),
              DownloadsImageWidth(
                imageList: imageList[2],
                borderRadius: 15,
                margin: const EdgeInsets.only(top: 5),
                size: Size(size.width * 0.4, size.width * 0.55),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonblue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Setup',
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kbuttonwhite,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'See what you can Download',
              style: TextStyle(
                  color: kbuttonBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
          size: 20,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}

class DownloadsImageWidth extends StatelessWidget {
  const DownloadsImageWidth({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.borderRadius = 10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(imageList),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
