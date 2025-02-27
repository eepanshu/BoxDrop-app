import 'package:flutter/material.dart';

import '../../../components/section_title.dart';
import '../../../constants.dart';

class Dietaries extends StatefulWidget {
  const Dietaries({
    Key? key,
  }) : super(key: key);

  @override
  _DietariesState createState() => _DietariesState();
}

class _DietariesState extends State<Dietaries> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(
          title: "Dietary",
          // When press the clean all
          press: () {},
          isMainSection: false, titleStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24, // Adjust the font size according to your design
          fontWeight: FontWeight.bold, // Use bold font weight for emphasis
          letterSpacing: 1.2, // Add letter spacing for better readability
          // You can also add other text properties such as fontFamily, fontStyle, etc.
        ),
        ),
        const SizedBox(height: defaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Wrap(
            spacing: 10,
            children: List.generate(
              demoDietaries.length,
              (index) => ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(56, 40),
                  backgroundColor: index == 1 ? primaryColor : bodyTextColor,
                ),
                child: Text(demoDietaries[index]["title"]),
              ),
            ),
          ),
        )
      ],
    );
  }

  List<Map<String, dynamic>> demoDietaries = [
    {"title": "Any", "isActive": false},
    {"title": "Vegetarian", "isActive": false},
    {"title": "Vegan", "isActive": false},
    {"title": "Gluten-Free", "isActive": false},
  ];
}
