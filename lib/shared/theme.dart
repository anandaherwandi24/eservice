import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

Color mainColor = "FFC700".toColor();
Color greyColor = "8d92a3".toColor();
Color purpleColor = "260868".toColor();
Color whiteColor = "FFFFFF".toColor();
Color blackColor = "000000".toColor();

TextStyle whiteFontStyle = GoogleFonts.poppins().copyWith(color: whiteColor);
TextStyle whiteFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle whiteFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.white);

TextStyle blackFontStyle = GoogleFonts.poppins().copyWith(color: purpleColor);
TextStyle blackFontStyle1 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.poppins()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(color: Colors.black);

const double defaultMargin = 24;
