import 'package:expense_zx/app/widgets/colorPick.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonFrequency extends StatelessWidget {
  final bool istrue;
  final String label;
  const ButtonFrequency({
    this.istrue = true,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(40),
      child: Ink(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: istrue ? appYellowSoft : appWhite80,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: istrue ? appYellow : appGrey,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
