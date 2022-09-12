import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text headerText(String text, {TextAlign align = TextAlign.left}) => Text(
      text,
      style: GoogleFonts.abel(color: Colors.blue.shade700, fontSize: 24),
      textAlign: align,
    );
Text bodyText(String text, {TextAlign align = TextAlign.left}) => Text(
      text,
      style: GoogleFonts.abel(
        color: Colors.grey.shade800,
        fontSize: 14,
      ),
      overflow: TextOverflow.ellipsis,
    );
