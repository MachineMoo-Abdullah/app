import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screen/screen.dart';
import 'package:myapp/screen/data/image_paths_data/images_data.dart';
import '../../data/menu_data/menu_names_data.dart';
import '../../data/tabs_data/tabsdata.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final PageController _pageController = PageController();

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    void navigateToCategoryPage(String category) {

      final tabs = categoryTabs[category] ?? [];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            categoryName: category,
            tabItems: tabs
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomDrawerMenu(size1: size),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             const EllipticalSearchBar(
              pageName: "Home",
              showDrawer: true, // Set to true to show the drawer icon
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categories",
                        style: GoogleFonts.poppins(
                      fontSize: size.height * 0.035,
                      fontWeight: FontWeight.w600,),
                      ),
                      InkWell(
                        onTap: () {
                          Provider.of<NavigationProvider>(context,
                                  listen: false)
                              .setIndex(1);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: size.width * 0.03),
                          child: const Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  SizedBox(
                    height: size.height * 0.18,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return CategoryItem(
                          imagePath: category.imagePath,
                          label: category.label,
                          onTap: () => navigateToCategoryPage(
                            category.label,
                          ),
                        );
                      },
                    ),
                  ),
                  Text(
                    "Featured Images",
                    style: GoogleFonts.poppins(
                      fontSize: size.height * 0.035,
                      fontWeight: FontWeight.w600,),
                  ),
                  SizedBox(height: size.height * 0.02),
                  BannerSection(
                    pageController: widget._pageController,
                    imagePaths:
                        bannerImagePaths.values.expand((x) => x).toList(),
                    showPoint: true,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "New products",
                    style: GoogleFonts.poppins(
                      fontSize: size.height * 0.035,
                      fontWeight: FontWeight.w600,),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.03),
                    //child: ProductList(products: products),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
