import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Menu/product_list_page.dart';

class MenuCategory extends StatefulWidget {
  final String title;
  final List<SubcategoryItem> subcategories;
  final bool isExpanded;
  final VoidCallback onExpansionChanged;

  const MenuCategory({super.key, 
    required this.title,
    required this.subcategories,
    required this.isExpanded,
    required this.onExpansionChanged,
  });

  @override
  State<MenuCategory> createState() => _MenuCategoryState();
}

class _MenuCategoryState extends State<MenuCategory> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        widget.title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      initiallyExpanded: widget.isExpanded,
      onExpansionChanged: (bool expanded) {
        widget.onExpansionChanged();
      },
      tilePadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16), // Adjust padding
      childrenPadding: const EdgeInsets.only(bottom: 8), // Add padding to the children
      children: widget.subcategories.map((subcategory) {
        if (subcategory.isHeading) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
            child: Text(
              subcategory.title,
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          );
        } else {
          return Container(
            height: 30, // Set height for subcategory items
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategoryPage(
                              subCategoryName: subcategory.title,
                              products: subcategory.productsitem,
                            ),
                          ),
                        );
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(subcategory.title),
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}

class SubcategoryItem {
  final String title;
  final bool isHeading;
  final List<Product>? productsitem; 

  SubcategoryItem({required this.title, this.isHeading = false, this.productsitem =  const []});
}
