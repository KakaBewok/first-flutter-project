// ignore: file_names
import 'package:flutter/material.dart';
import 'package:bandung_vacation/model/tourism_place.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TourismPlace place;

  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(place: place);
        } else {
          return DetailMobilePage(place: place);
        }
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TourismPlace place;

  const DetailMobilePage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(place.imageAsset),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ]),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: Text(
              place.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Staatliches',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Icon(Icons.calendar_today),
                    const SizedBox(height: 8.0),
                    Text(
                      place.openDays,
                      style: informationTextStyle,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.access_time),
                    const SizedBox(height: 8.0),
                    Text(
                      place.openTime,
                      style: informationTextStyle,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Icon(Icons.monetization_on),
                    const SizedBox(height: 8.0),
                    Text(
                      place.ticketPrice,
                      style: informationTextStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              place.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16.0,
                fontFamily: 'Oxygen',
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: place.imageUrls.map((url) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(url),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    ));
  }
}

class DetailWebPage extends StatelessWidget {
  final TourismPlace place;

  const DetailWebPage({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Wisata Bandung',
            style: TextStyle(
              fontFamily: 'Staatliches',
              fontSize: 32,
            ),
          ),
          SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [],
                ),
              ),
              SizedBox(width: 32),
              Expanded(
                child: Card(),
              ),
            ],
          ),
          // Stack(
          //   children: <Widget>[
          //     Image.asset(place.imageAsset),
          //     SafeArea(
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               CircleAvatar(
          //                 backgroundColor: Colors.grey,
          //                 child: IconButton(
          //                   icon: const Icon(
          //                     Icons.arrow_back,
          //                     color: Colors.white,
          //                   ),
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   },
          //                 ),
          //               ),
          //               const FavoriteButton(),
          //             ]),
          //       ),
          //     ),
          //   ],
          // ),
          // Container(
          //   margin: const EdgeInsets.only(top: 16.0),
          //   child: Text(
          //     place.name,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 30.0,
          //       fontFamily: 'Staatliches',
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: const EdgeInsets.symmetric(vertical: 16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       Column(
          //         children: <Widget>[
          //           const Icon(Icons.calendar_today),
          //           const SizedBox(height: 8.0),
          //           Text(
          //             place.openDays,
          //             style: informationTextStyle,
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: <Widget>[
          //           const Icon(Icons.access_time),
          //           const SizedBox(height: 8.0),
          //           Text(
          //             place.openTime,
          //             style: informationTextStyle,
          //           )
          //         ],
          //       ),
          //       Column(
          //         children: <Widget>[
          //           const Icon(Icons.monetization_on),
          //           const SizedBox(height: 8.0),
          //           Text(
          //             place.ticketPrice,
          //             style: informationTextStyle,
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Text(
          //     place.description,
          //     textAlign: TextAlign.center,
          //     style: const TextStyle(
          //       fontSize: 16.0,
          //       fontFamily: 'Oxygen',
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 150,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: place.imageUrls.map((url) {
          //       return Padding(
          //         padding: const EdgeInsets.all(4.0),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(10),
          //           child: Image.network(url),
          //         ),
          //       );
          //     }).toList(),
          //   ),
          // )
        ],
      ),
    ));
  }
}

bool isFavorite = false;

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
