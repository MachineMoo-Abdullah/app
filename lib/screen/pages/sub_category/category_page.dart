import 'package:flutter/material.dart';
import 'package:myapp/screen/data/tabs_data/categories_data.dart';
import '../../components/top_bar.dart';
import '../Menu/product_list_page.dart'; // Update with the correct import path

class SubCategory {
  final String imagePath;
  final String title;
  final double price;
  final List<Product> products; // Add this field

  SubCategory({
    required this.imagePath,
    required this.title,
    required this.price,
    required this.products, // Initialize this field
  });
}

class CategoryPage extends StatefulWidget {
  final String categoryName;
  final List<String> tabItems;

  const CategoryPage({
    required this.categoryName,
    required this.tabItems,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
     final screenWidth = MediaQuery.of(context).size.width;

    // Define the desired card width
    const double cardWidth = 150.0;

    // Calculate the number of cards that can fit in the row based on the screen width
    int crossAxisCount = (screenWidth / cardWidth).floor();

    return Scaffold(
      body: Column(
        children: [
          EllipticalSearchBar(
            pageName: widget.categoryName,
            showBackButton: true,
          ),
          TabBar(
            controller: _tabController,
            tabs: widget.tabItems.map((item) => Tab(text: item)).toList(),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: widget.tabItems.map((item) {
                // Retrieve subcategories for the current tab
                final subcategories = categoryProducts[widget.categoryName]?[item] ?? [];

                return  GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount, // Adjust number of cards per row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.9, // Adjust for shorter card height
                  ),
                  itemCount: subcategories.length,
                  itemBuilder: (context, index) {
                    final subcategory = subcategories[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigate to SubCategoryPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubCategoryPage(
                              subCategoryName: subcategory.title,
                              products: subcategory.products,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            // Calculate dynamic height and width based on available constraints
                            double cardHeight = constraints.maxHeight;
                            double imageHeight = cardHeight * 0.6; // Adjust this ratio as needed
                            double titleFontSize = constraints.maxWidth * 0.08; // Adjust title font size based on card width
                            double priceFontSize = constraints.maxWidth * 0.06; // Adjust price font size based on card width

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: imageHeight,
                                  width: constraints.maxWidth, // Make sure image fits the card's width
                                  child: Image.asset(
                                    subcategory.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    subcategory.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: titleFontSize, // Dynamic font size
                                    ),
                                    overflow: TextOverflow.ellipsis, // Avoid text overflow
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Text(
                                    'Starting from \$${subcategory.price.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: priceFontSize, // Dynamic font size
                                    ),
                                    overflow: TextOverflow.ellipsis, // Avoid text overflow
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )

                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
