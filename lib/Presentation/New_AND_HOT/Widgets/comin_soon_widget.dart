import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/core/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              "Apr",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Text(
              "11",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ]),
        ),
        Container(
          width: size.width - 50,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.network(
                        'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/ovM06PdF3M8wvKb06i4sjW3xoww.jpg',
                        fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black12.withOpacity(0.5),
                      radius: 15,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.volume_off),
                        iconSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "AVATAR 2 ",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -4),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        addButton(
                          icon: Icons.notifications,
                          title: "Remind me",
                          icoSize: 20,
                          textSize: 12,
                        ),
                        kWidth,
                        addButton(
                          icon: Icons.info_outline,
                          title: "Info",
                          icoSize: 20,
                          textSize: 12,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text("Coming on Tuesday"),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.edigitalagency.com.au/wp-content/uploads/Netflix-N-Symbol-logo-red-transparent-RGB-png.png"))),
                  ),
                  Text(
                    "FILM",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white.withOpacity(0.5),
                        letterSpacing: 2),
                  )
                ],
              ),
              kHeight,
              const Text(
                "Avatar 2 ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              kHeight,
              Text(
                "Jake Sully and Ney'tiri have formed a family and are doing everything to stay together. However, they must leave their home and explore the regions of Pandora. When an ancient threat resurfaces, Jake must fight a difficult war against the humans.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
