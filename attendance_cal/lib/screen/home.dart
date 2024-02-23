import 'package:attendance_cal/widget/form.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final keyboardheight = MediaQuery.of(context).viewInsets.bottom;

    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campus Clockout',
          style: GoogleFonts.blackOpsOne(),
        ),
        centerTitle: true,
        elevation: 200,
      ),
      body: Column(
        children: [
          Card(
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: (height - (keyboardheight + 100)),
              width: double.infinity,
              child: const SingleChildScrollView(child: FormBody()),
            ),
          ),
        ],
      ),
    );
  }
}
