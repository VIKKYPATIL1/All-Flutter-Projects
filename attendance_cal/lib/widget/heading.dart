import 'package:attendance_cal/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading extends StatelessWidget {
  const Heading({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 40,
        child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                image: DecorationImage(
                    opacity: 0.9,
                    fit: BoxFit.fill,
                    image: AssetImage('assets/headingupdate.png'))),
            height: 100,
            width: double.infinity,
            child: Container(
              margin: EdgeInsets.only(top: 0, left: 10, bottom: 40),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                    style: GoogleFonts.blackOpsOne(
                        fontWeight: FontWeight.normal,
                        color: kcolorScheme.onBackground,
                        fontSize: 20),
                    "Welcome!"),
              ),
            )));
  }
}
