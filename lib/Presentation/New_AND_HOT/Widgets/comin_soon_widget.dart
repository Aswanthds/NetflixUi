import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/core/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String descp;

  const ComingSoonWidget({
    super.key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.descp,
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
              month,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Text(
              day,
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
                    child: Image.network(posterPath, fit: BoxFit.cover),
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
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            //letterSpacing: -1
                            ),
                      ),
                    ),
                  ),
                  //const Spacer(),
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
              //Text("Coming on Tuesday"),
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
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1),
              ),
              kHeight,
              Text(
                descp,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
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
