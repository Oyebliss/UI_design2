import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCategories extends StatefulWidget {
  const ItemCategories({super.key});

  @override
  State<ItemCategories> createState() => _ItemCategoriesState();
}

class _ItemCategoriesState extends State<ItemCategories> {
  final List<String> circleImage = [
    'images/interior.jpg',
    'images/tech.jpg',
    'images/light 1.jpg',
    'images/furniture.jpg',
    'images/dish.jpg',
  ];

  final List<String> circleText = [
    'Interior',
    'Technology',
    'Lighting',
    'Furniture',
    'Dishes',
  ];

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: circleImage.length,
          itemBuilder: (context, index) {
            final isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            circleImage[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(
                          color: isSelected
                              ? Color(0xfff26363)
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    circleText[index],
                    style: GoogleFonts.jetBrainsMono(
                      color: isSelected ? Color(0xfff26363) : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
