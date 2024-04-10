import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/colorPick.dart';

class IncomeItems extends StatelessWidget {
  final Color warna;
  final String title;
  final String subtitle;
  final String path;

  const IncomeItems({
    required this.warna,
    required this.title,
    required this.subtitle,
    required this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 164,
      height: 80,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Image.asset(
            path,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: appWhite80,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  color: appWhite80,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
