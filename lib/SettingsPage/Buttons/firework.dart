import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class Firework extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Stack(children: <Widget>[
            Positioned(
                top: 100,
                left: 10,
                height: 200,
                width: 500,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_red.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 500,
                left: 10,
                height: 150,
                width: 200,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_blue.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 300,
                left: 10,
                height: 150,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_green.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 100,
                left: 10,
                height: 150,
                width: 200,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_pink.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 600,
                left: 50,
                height: 150,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_yellow.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 450,
                left: 10,
                height: 150,
                width: 600,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_pink.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 600,
                left: 10,
                height: 150,
                width: 600,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_red.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 300,
                left: 100,
                height: 200,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_yellow.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 50,
                left: 200,
                height: 150,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_blue.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 400,
                left: 1,
                height: 150,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_red.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 200,
                left: 1,
                height: 150,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_red1.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 100,
                left: 1,
                height: 150,
                width: 300,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_blue1.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 500,
                left: 1,
                height: 150,
                width: 500,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_blue1.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 150,
                left: 1,
                height: 150,
                width: 600,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_yellow1.flr",
                  animation: "explode",
                ))),
            Positioned(
                top: 500,
                left: 1,
                height: 150,
                width: 600,
                child: Container(
                    child: FlareActor(
                  "assets/animation/firework_pink1.flr",
                  animation: "explode",
                ))),
          ])),
    );
  }

  static void startFlare(FlareActor flare) {}
}
