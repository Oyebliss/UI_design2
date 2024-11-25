import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridView extends StatelessWidget {
  final String imagePath;
  final String price;
  final String productTitle;
  final String? actualPrice;
  final String? discount;
  final String? badgeText;

  const ProductGridView({
    super.key,
    required this.imagePath,
    this.discount,
    this.badgeText,
    required this.price,
    required this.productTitle,
    this.actualPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              if (discount != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      discount!,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              if (badgeText != null)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      badgeText!,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Text(
              price,
              style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              actualPrice!,
              style: GoogleFonts.jetBrainsMono(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        Text(
          productTitle,
          style: GoogleFonts.jetBrainsMono(fontSize: 13),
        )
      ],
    );
  }
}
