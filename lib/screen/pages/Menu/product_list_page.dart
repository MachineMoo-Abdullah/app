import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screen/pages/product_details/details.dart';
import 'package:myapp/screen/screen.dart';

import 'contact_us.dart';

class Product {
  final String imagePath;
  final String title;
  final double price;
  final String description;
  final String id;

  Product({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.description,
    required this.id,
  });
}

class SubCategoryPage extends StatelessWidget {
  final String subCategoryName;
  final List<Product>? products;

  const SubCategoryPage({
    required this.subCategoryName,
    this.products,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          EllipticalSearchBar(
            pageName: subCategoryName,
            showBackButton: true,
          ),
          Expanded(
            child: products == null || products!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Currently, products are not available",
                          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        const SizedBox(height: 10), // Add some space between the text elements
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Contact us",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: kPrimaryColor, // Ensure this color is defined in your constants
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to ContactUsPage
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ContactUsPage(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final screenWidth = constraints.maxWidth;
                      const double cardWidth = 150.0;
                      int crossAxisCount = (screenWidth / cardWidth).floor();

                      return GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.75, // Adjust for proper aspect ratio
                        ),
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          final product = products![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailPage(
                                    id: product.id,
                                    imagePath: product.imagePath,
                                    name: product.title,
                                    description: product.description,
                                    price: product.price,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              child: LayoutBuilder(
                                builder: (context, cardConstraints) {
                                  double cardHeight = cardConstraints.maxHeight;
                                  double imageHeight = cardHeight * 0.6;
                                  double titleFontSize = cardConstraints.maxWidth * 0.08;
                                  double priceFontSize = cardConstraints.maxWidth * 0.06;

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: imageHeight,
                                        width: cardConstraints.maxWidth,
                                        child: Image.asset(
                                          product.imagePath,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          product.title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: titleFontSize,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          '\$${product.price.toStringAsFixed(2)}',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: priceFontSize,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
