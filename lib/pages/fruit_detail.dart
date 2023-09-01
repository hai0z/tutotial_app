import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/fruit.dart';

// ignore: must_be_immutable
class FruitDetail extends StatelessWidget {
  Fruit fruit;

  FruitDetail({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fruit.color[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 32,
                  ),
                ),
              ),
              Center(
                  child: Hero(
                tag: fruit.name,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Image.asset(
                    fruit.imgPath,
                    height: 250,
                  ),
                ),
              )),
              const SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      fruit.name,
                      style: GoogleFonts.lato(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Price: \$${fruit.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.lato(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Et malesuada fames ac turpis egestas maecenas pharetra. Suspendisse in est ante in nibh mauris cursus. Tortor condimentum lacinia quis vel. Dolor purus non enim praesent. Cursus turpis massa tincidunt dui ut ornare lectus sit amet. Facilisi nullam vehicula ipsum a arcu cursus vitae congue. Magna ac placerat vestibulum lectus mauris. Venenatis lectus magna fringilla urna. Lectus vestibulum mattis ullamcorper velit sed ullamcorper morbi. Bibendum at varius vel pharetra vel turpis nunc eget. Nisl pretium fusce id velit ut tortor. Pellentesque adipiscing commodo elit at imperdiet dui.",
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.w300, height: 2),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
