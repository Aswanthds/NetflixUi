import 'package:flutter/material.dart';
import 'package:netflix_ui/Presentation/home/Widgets/custom_btWidget.dart';
import 'package:netflix_ui/core/constants.dart';


class EveryonesiwatchingWidget extends StatelessWidget {
  
  final String posterPath;
  final String movieName;
  final String descp;
  const EveryonesiwatchingWidget({
    super.key, required this.posterPath, required this.movieName, required this.descp,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                     
                      posterPath,
                      loadingBuilder: (_ , child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }else{
                          return Center(child: CircularProgressIndicator(strokeWidth: 2,));

                        }
                      },
                      errorBuilder: (_, error, stackTrace) {
                        return Center(child: Icon(Icons.image_not_supported, color: Colors.white,size: 50,));
                      },
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              
              
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      addButton(
                        icon: Icons.telegram_rounded,
                        title: "Share ",
                        icoSize: 30,
                        textSize: 12,
                      ),
                      kWidth,
                      addButton(
                        icon: Icons.add,
                        title: "My List",
                        icoSize: 30,
                        textSize: 12,
                      ),
                      kWidth,
                      addButton(
                        icon: Icons.play_arrow,
                        title: "Play",
                        icoSize: 30,
                        textSize: 12,
                      ),
                      kWidth,
                    ],
                  ),
                )
              ],
            ),
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
                  "Series",
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.5),
                      letterSpacing: 2),
                )
              ],
            ),
             Text(
              movieName,
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
            kHeight50,
          ],
        ),
      ],
    );
  }
}