import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 80, top: 120),
            child: Image.asset('lib/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              textAlign: TextAlign.center,
              "We deliver  groceries at your doorstep",
              style:
                  GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'Fresh item every day',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            },
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                  color: Colors.primaries[1],
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
