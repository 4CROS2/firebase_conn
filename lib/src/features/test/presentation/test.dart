import 'dart:math' as math;

import 'package:extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FlutterMap(
            options: MapOptions(initialCenter: LatLng(39.000256, -3.378289)),

            children: <Widget>[
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}@4x.png',
                subdomains: <String>['a', 'b', 'c'],
                userAgentPackageName: 'com.crossdev.quickdrop_sellers',
                retinaMode: true,
              ),
            ],
          ),
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TButton(icon: Icons.arrow_back_ios_new_rounded),
                  Column(
                    spacing: 20,
                    children: <Widget>[
                      TButton(icon: Icons.search),
                      TButton(
                        icon: Icons.navigation_rounded,
                        rotate: math.pi / 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: LocationInformation(),
          ),
        ],
      ),
    );
  }
}

class TButton extends StatelessWidget {
  const TButton({required IconData icon, double rotate = 0, super.key})
    : _icon = icon,
      _rotate = rotate;
  final IconData _icon;
  final double _rotate;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: _shadows(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Transform.rotate(
          origin: Offset(0, 0),
          angle: _rotate,
          child: Icon(_icon, size: 24),
        ),
      ),
    );
  }
}

class LocationInformation extends StatelessWidget {
  const LocationInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: _shadows(),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 260,
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Positioned(
              left: 16,
              right: 0,
              top: -26,
              child: Column(
                spacing: 10,
                children: <Widget>[
                  SizedBox(
                    height: 160,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 180,
                          height: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'https://cdn.imago-images.com/Images/header/hello-we-are-imago_03-2023.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
      
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            spacing: 10,
                            children: <Widget>[
                              const Icon(
                                Icons.favorite,
                                color: Colors.lightGreen,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  '97% for you',
                                  style: TextStyle(
                                    fontFamily: 'Questrial',
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cartagena cafe',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            fontFamily: 'questrial',
                          ),
                        ),
                        Text(
                          'description de la ubicacion '.capitalize() * 120,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'questrial',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<BoxShadow> _shadows() {
  return <BoxShadow>[
    BoxShadow(
      color: Color.fromRGBO(255, 2, 2, 0.298),
      offset: Offset(0, 30),
      blurRadius: 60,
      spreadRadius: -30,
    ),
    BoxShadow(
      color: Color.fromRGBO(50, 50, 93, 0.25),
      offset: Offset(0, 50),
      blurRadius: 100,
      spreadRadius: -20,
    ),
  ];
}
