import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final Function(String) onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CategoryItem(
              imagePath: category.imagePath,
              label: category.label,
              onTap: () => onCategorySelected(category.label),
            ),
          );
        },
      ),
    );
  }
}
