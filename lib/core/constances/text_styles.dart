
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../service/media_query_service.dart';
class myText extends StatelessWidget {

 final  String text;
 final Color textColor;
 final double size;
  const myText({required this.text,required this.textColor,required this.size,Key? key});

  @override
  Widget build(BuildContext context) {
    return  Text(
     text,
      style: TextStyle(  fontFamily: GoogleFonts.raleway().fontFamily,fontSize: MySize.screenWidth(context) * size,color: textColor),

    );
  }
}
