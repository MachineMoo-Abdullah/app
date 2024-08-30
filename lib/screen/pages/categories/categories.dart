import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screen/data/image_paths_data/images_data.dart';
import 'package:myapp/screen/data/menu_data/menu_names_data.dart';
import 'package:myapp/screen/screen.dart';

import '../../data/tabs_data/tabsdata.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _onCategoryTap(BuildContext context, String categoryLabel) {
    final tabs = categoryTabs[categoryLabel] ?? [];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryPage(
          categoryName: categoryLabel,
          tabItems: tabs,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomDrawerMenu(size1: size),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EllipticalSearchBar(
            pageName: "Categories",
            showDrawer: true,
            showBackButton: false,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.03,
                vertical: size.height * 0.02,
              ),
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250, // Fixed width for each card
                  childAspectRatio: 0.8, // Adjust for fixed height
                  crossAxisSpacing: size.width * 0.03,
                  mainAxisSpacing: size.height * 0.02,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final bannerImagePath = bannerImagePaths[category.label]?.first ?? ''; // Get the first image path

                  return SizedBox(
                    width: 100,
                    height: 150, 
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          _onCategoryTap(context, category.label);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15.0),
                                ),
                                child: Image.asset(
                                  bannerImagePath,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(child: Text('Image not found'));
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                category.label,
                                style: GoogleFonts.poppins(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
