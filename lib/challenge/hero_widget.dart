import 'package:flutter/material.dart';
import 'package:tap2024/challenge/attribute_widget.dart';
import 'package:tap2024/challenge/hero_details_page.dart';
import 'dart:math' as math;

import 'hero_model.dart';

// Degree / Radians converter
const double degrees2Radians = math.pi / 180.0;
const double radians2Degrees = 180.0 / math.pi;

double degrees(double radians) => radians * radians2Degrees;

double radians(double degrees) => degrees * degrees2Radians;

class HeroRowWidget extends StatelessWidget {
  final HeroModel hero;
  final double rowHeight;

  const HeroRowWidget({
    required this.hero,
    this.rowHeight = 282,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rowHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.translate(
            offset: Offset(-10, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(1.5)),
              child: Container(
                height: 216,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-44, 0),
            child: Transform(
              alignment: FractionalOffset.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.01)
                ..rotateY(radians(8)),
              child: Container(
                height: 188,
                margin: EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.all(Radius.circular(22)),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Transform.translate(
                offset: Offset(-30, 0),
                child: Container(
                  child: Hero(
                    tag: hero.name,
                    child: Image.asset(
                      hero.image,
                      width: rowHeight,
                      height: rowHeight,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 58),
              padding: EdgeInsets.symmetric(vertical: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AttributeWidget(
                    progress: hero.speed,
                    key: GlobalKey(),
                    child: Image.asset(speed),
                    
                  ),
                  AttributeWidget(
                    progress: hero.health,
                    key: GlobalKey(),
                    child: Image.asset(heart),
                  ),
                  AttributeWidget(
                    progress: hero.attack,
                    key: GlobalKey(),
                    child: Image.asset(knife,
                    height: 100,
                    width: 100,),
                  ),
                  SizedBox(
                    height: 32,
                    child: OutlinedButton(
                      child: new Text(
                        'See Details',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return HeroDetailsPage(hero);
                        }));
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white, side: BorderSide(
                        color: Colors.white, // Color del borde
                        width: 1, // Grosor del borde
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}