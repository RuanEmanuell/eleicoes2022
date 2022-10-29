import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controller/controller.dart';

class SmartphoneWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    num percentage;

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Consumer<Controller>(builder: (context, value, child) {
      percentage = value.json != null ? double.parse("0.${value.json["pvp"].substring(0, 1)}") : 0;

      return value.loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                      child: Text("Porcentagem das urnas apuradas: ${value.json["pvp"]}%",
                          style: GoogleFonts.robotoMono())),
                  Container(
                    alignment: Alignment.topLeft,
                    child: AnimatedContainer(
                      color: Colors.blue,
                      height: screenHeight / 30,
                      width: screenWidth / 10 * (percentage * 10),
                      duration: const Duration(seconds: 2),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 1.1,
                    child: ListView.builder(
                      itemCount: value.json["cand"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(
                                    left: screenWidth / 25,
                                    right: screenWidth / 25,
                                    bottom: screenHeight / 20),
                                width: screenWidth,
                                height: screenHeight / 2,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: screenHeight / 25, bottom: screenHeight / 25),
                                        width: screenWidth / 2.5,
                                        decoration: BoxDecoration(
                                          color: value.json["cand"][index]["nm"] == "LULA"
                                              ? Colors.red
                                              : Colors.green,
                                          borderRadius: BorderRadius.circular(120),
                                        ),
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(120),
                                            child: Image.asset(
                                                "assets/images/${value.json["cand"][index]["nm"].toLowerCase()}.png"))),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(value.json["cand"][index]["nm"],
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23,
                                                color: value.json["cand"][index]["nm"] == "LULA"
                                                    ? Colors.red
                                                    : Colors.green)),
                                        const SizedBox(width: 5),
                                        Text(value.json["cand"][index]["n"],
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 23,
                                                color: value.json["cand"][index]["nm"] == "LULA"
                                                    ? Colors.red
                                                    : Colors.green)),
                                      ],
                                    ),
                                    Text("${value.json["cand"][index]["pvap"]}%",
                                        style: GoogleFonts.robotoMono(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),
                                    Text("${value.json["cand"][index]["vap"]} votos",
                                        style: GoogleFonts.robotoMono(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )),
                                  ],
                                )),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
    });
  }
}
