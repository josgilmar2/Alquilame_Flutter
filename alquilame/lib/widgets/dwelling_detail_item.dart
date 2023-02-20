import 'package:alquilame/models/models.dart';
import 'package:flutter/material.dart';

class DwellingDetailItem extends StatelessWidget {
  const DwellingDetailItem({super.key, required this.dwellingDetail});

  final OneDwellingResponse? dwellingDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Container(
              foregroundDecoration: BoxDecoration(color: Colors.black26),
              height: 400,
              child: Image.network(
                  "http://localhost:8080/download/${dwellingDetail?.image}",
                  fit: BoxFit.cover)),
          SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 250),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "${dwellingDetail?.name}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 16.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "${dwellingDetail?.address}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 13.0),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      color: Colors.white,
                      icon: const Icon(Icons.favorite_border),
                      onPressed: () {},
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(32.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.star_border,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(children: [
                                    const WidgetSpan(
                                        child: Icon(
                                      Icons.location_on,
                                      size: 16.0,
                                      color: Colors.grey,
                                    )),
                                    TextSpan(
                                        text: "${dwellingDetail?.province}"),
                                    const WidgetSpan(
                                      child: SizedBox(
                                        width: 10.0,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        dwellingDetail?.hasElevator == true
                                            ? Icons.elevator
                                            : Icons.elevator_outlined,
                                        size: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        dwellingDetail?.hasPool == true
                                            ? Icons.pool
                                            : Icons.pool_outlined,
                                        size: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        dwellingDetail?.hasTerrace == true
                                            ? Icons.balcony
                                            : Icons.balcony_outlined,
                                        size: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        dwellingDetail?.hasGarage == true
                                            ? Icons.garage
                                            : Icons.garage_outlined,
                                        size: 16.0,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ]),
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "${dwellingDetail?.price}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Text(
                                "${dwellingDetail?.m2}",
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              vertical: 16.0,
                              horizontal: 32.0,
                            ),
                          ),
                          child: const Text(
                            "Book Now",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                          onPressed: () {
                            //ESTO SE HARÁ EN EL PROYECTO FINAL
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Text(
                        "Description".toUpperCase(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "${dwellingDetail?.description}",
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 14.0),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              title: const Text(
                "DETAIL",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
