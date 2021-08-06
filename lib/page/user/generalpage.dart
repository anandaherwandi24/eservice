import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/widgets.dart';

class GeneralPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onBackButtonPressed;
  final Widget child;
  final Color backColor;

  GeneralPage(
      {this.title = "Title",
      this.subtitle = "subtittle",
      this.onBackButtonPressed,
      this.child,
      this.backColor});

  get defaultMargin => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SafeArea(
            child: Container(
          color: backColor ?? "FFFFFF".toColor(),
        )),
        SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(bottom: defaultMargin),
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    width: double.infinity,
                    height: 100,
                    color: Colors.yellow[700],
                    child: Row(
                      children: [
                        onBackButtonPressed != null
                            ? GestureDetector(
                                onTap: () {
                                  if (onBackButtonPressed != null) {
                                    onBackButtonPressed();
                                  }
                                },
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  margin: EdgeInsets.only(right: 26),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'image/back_arrow.png'))),
                                ),
                              )
                            : SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.poppins(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              subtitle,
                              style: GoogleFonts.poppins(
                                  color: "000000".toColor(),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: defaultMargin,
                    width: double.infinity,
                    color: "FFFFFF".toColor(),
                  ),
                  child ?? SizedBox()
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
