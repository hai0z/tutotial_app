import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutotial_app/pages/home_page.dart';

class IntoPage extends StatelessWidget {
  const IntoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(25.h),
            child: Image.asset('lib/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              textAlign: TextAlign.center,
              "We deliver  groceries at your doorstep",
              style:
                  GoogleFonts.lato(fontSize: 40.w, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Fresh item every day',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12)),
              child: Text(
                "Get started",
                style: GoogleFonts.lato(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
