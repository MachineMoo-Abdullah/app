import 'package:myapp/screen/screen.dart';
import '../../pages/intro_pages/on_boarding.dart';
import '../../pages/Menu/about_us.dart';
import '../../pages/Menu/contact_us.dart';
import '../../pages/Menu/dels_offers.dart';
import '../../pages/home/components/home_menu.dart';
import '../products/products_data.dart';

class CustomDrawerMenu extends StatefulWidget {
  final Size size1;

  const CustomDrawerMenu({super.key, required this.size1});

  @override
  // ignore: library_private_types_in_public_api
  _CustomDrawerMenuState createState() => _CustomDrawerMenuState();
}

class _CustomDrawerMenuState extends State<CustomDrawerMenu> {
  late ScrollController _scrollController;
  String _expandedCategory = '';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void _scrollToCategory(int index) {
    // Scroll based on the category index
    double offset = index * 50.0; // Adjust based on your tile height
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _toggleCategory(String category, int index) {
    setState(() {
      if (_expandedCategory == category) {
        _expandedCategory = ''; // Collapse if already expanded
      } else {
        _expandedCategory = category; // Expand new category
        _scrollToCategory(index); // Scroll to new category
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        const SizedBox(
          height: 70,
          child: DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OpenSans",
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            _scrollToCategory(0);
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Bottomnavbar()),
            );
            Provider.of<NavigationProvider>(context,
                listen: false)
            .setIndex(0);
          },
        ),
        ListTile(
          title: const Text('Deals Zone'),
          onTap: () {
            _scrollToCategory(1); 
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DealPage()),
            );
          },
        ),
        MenuCategory(
          title: 'Sofas',
          subcategories: [
            SubcategoryItem(title: 'Sofa Set', isHeading: true),
            SubcategoryItem(title: 'Sofa'),
            SubcategoryItem(title: 'Fabric Sofa Set',productsitem:  productCategories['Fabric Sofa Set']?? []),
            SubcategoryItem(title: 'Luxury Leather Sofas'),
            SubcategoryItem(title: 'Letherette Sofas Set'),
            SubcategoryItem(title: 'Leather Sofa Set',productsitem:  productCategories['Leather Sofa Set']?? []),
            SubcategoryItem(title: 'L Shaped Sofa Sets'),
            SubcategoryItem(title: 'LoveSeats'),
            SubcategoryItem(title: 'Seaters Set', isHeading: true),
            SubcategoryItem(title: '1 Seater Sofa'),
            SubcategoryItem(title: '2 Seater Sofa'),
            SubcategoryItem(title: '3 Seater Sofa'),
            SubcategoryItem(title: 'All Sofas'),
            SubcategoryItem(title: 'Sofa Bed', isHeading: true),
            SubcategoryItem(title: 'Sofa Cum Bed'),
            SubcategoryItem(title: 'Diwans'),
            SubcategoryItem(title: 'Futons'),
            SubcategoryItem(title: 'Seating', isHeading: true),
            SubcategoryItem(title: 'Lounge Chairs'),
            SubcategoryItem(title: 'Accent Chairs'),
            SubcategoryItem(title: 'Stools'),
            SubcategoryItem(title: 'Benches'),
            SubcategoryItem(title: 'Rocking Chairs'),
            SubcategoryItem(title: 'Gaming Chairs'),
            SubcategoryItem(title: 'Chairs'),
          ],
          isExpanded: _expandedCategory == 'Sofas',
          onExpansionChanged: () => _toggleCategory('Sofas', 2),
          ),
        MenuCategory(
          title: 'Living',
          subcategories: [
            SubcategoryItem(title: 'Tables', isHeading: true),
            SubcategoryItem(title: 'Coffee Tables'),
            SubcategoryItem(title: 'Side and End Tables'),
            SubcategoryItem(title: 'Console Tables'),
            SubcategoryItem(title: 'Storage', isHeading: true),
            SubcategoryItem(title: 'TV Units'),
            SubcategoryItem(title: 'Book Shelves'),
            SubcategoryItem(title: 'Shoe Racks'),
            SubcategoryItem(title: 'Wall shelves'),
            SubcategoryItem(title: 'Seating', isHeading: true),
            SubcategoryItem(title: 'Lounge Chairs'),
            SubcategoryItem(title: 'Accent Chairs'),
            SubcategoryItem(title: 'Stools'),
            SubcategoryItem(title: 'Benches'),
            SubcategoryItem(title: 'Rocking Chairs'),
            SubcategoryItem(title: 'Gaming Chairs'),
            SubcategoryItem(title: 'Chairs'),
          ],
          isExpanded: _expandedCategory == 'Living',
          onExpansionChanged: () => _toggleCategory('Living', 3),
        ),
        MenuCategory(
          title: 'Bedroom and Mettresses',
          subcategories: [
            SubcategoryItem(title: 'All Beds', isHeading: true),
            SubcategoryItem(title: 'Beds'),
            SubcategoryItem(title: 'Beds with Storage'),
            SubcategoryItem(title: 'Beds without Storage'),
            SubcategoryItem(title: 'King Size Beds'),
            SubcategoryItem(title: 'Queen Size Beds'),
            SubcategoryItem(title: 'Single Beds'),
            SubcategoryItem(title: 'Beds Matteress Sets'),
            SubcategoryItem(title: 'Sofa Cum Beds'),
            SubcategoryItem(title: 'Mattresses', isHeading: true),
            SubcategoryItem(title: 'All Mattresses'),
            SubcategoryItem(title: 'King Size Mattress'),
            SubcategoryItem(title: 'Queen Size Mattress'),
            SubcategoryItem(title: 'Single Bed Mattress'),
            SubcategoryItem(title: 'Mattress by Material'),
            SubcategoryItem(title: 'Mattress by Brand'),
            SubcategoryItem(title: 'Mattress Protectors'),
            SubcategoryItem(title: 'Pillows'),
            SubcategoryItem(title: 'Storage and Accessories', isHeading: true),
            SubcategoryItem(title: 'Wardrobes'),
            SubcategoryItem(title: 'Bedside Tables'),
            SubcategoryItem(title: 'Chest of Drawers'),
            SubcategoryItem(title: 'Dressers and Mirrors'),
            SubcategoryItem(title: 'Modular Wardrobes'),
            SubcategoryItem(title: 'Benches'),
            SubcategoryItem(title: 'Storage Chests'),
            SubcategoryItem(title: 'Bedroom Chairs'),
            SubcategoryItem(title: 'Plastic Storage'),
            SubcategoryItem(title: 'Kids Room', isHeading: true),
            SubcategoryItem(title: 'Kids Beds'),
            SubcategoryItem(title: 'Kids Tables'),
            SubcategoryItem(title: 'Bunk Beds'),
            SubcategoryItem(title: 'Kids Seatimg'),
            SubcategoryItem(title: 'Kids Decor'),
          ],
          isExpanded: _expandedCategory == 'Bedroom and Mattresses',
          onExpansionChanged: () => _toggleCategory('Bedroom and Mattresses', 4),
        ),
        MenuCategory(
          title: 'Dining',
          subcategories: [
            SubcategoryItem(title: 'Storage', isHeading: true),
            SubcategoryItem(title: 'Crocery Units'),
            SubcategoryItem(title: 'Kitchen Cabinet & Racks'),
            SubcategoryItem(title: 'Modular Kitchen'),
            SubcategoryItem(title: 'Table Sets', isHeading: true),
            SubcategoryItem(title: '6 Seater Dining Table Set'),
            SubcategoryItem(title: '4 Seater Dining Table Set'),
            SubcategoryItem(title: '2 & 3 Seater Dining Table Set'),
            SubcategoryItem(title: '8 Seater Dining Table Set'),
            SubcategoryItem(title: 'Dining Tables'),
            SubcategoryItem(title: 'Dining Chairs'),
            SubcategoryItem(title: 'Dining Benches'),
            SubcategoryItem(title: 'All Dining Table Set'),
            SubcategoryItem(title: 'Chair Pads'),
            SubcategoryItem(title: 'Folding Small Dining Table Set'), 
          ],
          isExpanded: _expandedCategory == 'Dining',
          onExpansionChanged: () => _toggleCategory('Dining', 5),
        ),
        MenuCategory(
          title: 'Study',
          subcategories: [
            SubcategoryItem(title: 'Study Table', isHeading: true),
            SubcategoryItem(title: 'Study Tables'),
            SubcategoryItem(title: 'Computer Tables'),
            SubcategoryItem(title: 'Office Tables'),
            SubcategoryItem(title: 'Laptop Tables'),
            SubcategoryItem(title: 'Study Chairs', isHeading: true),
            SubcategoryItem(title: 'Study Chairs'),
            SubcategoryItem(title: 'Office Chairs'),
            SubcategoryItem(title: 'Ergonomic Study Chairs'),
            SubcategoryItem(title: 'Gaming Chairs'),
            SubcategoryItem(title: 'Storage', isHeading: true),
            SubcategoryItem(title: 'BookShelves'),
            SubcategoryItem(title: 'Wall Shelves'),
            SubcategoryItem(title: 'Decor', isHeading: true),
            SubcategoryItem(title: 'Study Lamps'),
          ],
          isExpanded: _expandedCategory == 'Study',
          onExpansionChanged: () => _toggleCategory('Study', 6),
          ),
        MenuCategory(
          title: 'Outdoor',
          subcategories: [
            SubcategoryItem(title: 'Balcony & Outdoors', isHeading: true),
            SubcategoryItem(title: 'Balcony Chairs'),
            SubcategoryItem(title: 'Balcony Sets'),
            SubcategoryItem(title: 'Swing Chairs'),
            SubcategoryItem(title: 'Outdoor Tables'),
            SubcategoryItem(title: 'Hammocks'),
            SubcategoryItem(title: 'Plastic Chairs'),
          ],
           isExpanded: _expandedCategory == 'Outdoor',
          onExpansionChanged: () => _toggleCategory('Outdoor', 7),
          ),
        MenuCategory(
          title: 'Storage Furniture',
          subcategories: [
            SubcategoryItem(title: 'Living Area Storage', isHeading: true),
            SubcategoryItem(title: 'Shoe Rack'),
            SubcategoryItem(title: 'BookShelves'),
            SubcategoryItem(title: 'Wall Shelves'),
            SubcategoryItem(title: 'Show Cases'),
            SubcategoryItem(title: 'Living Room Sets'),
            SubcategoryItem(title: 'BedRoom Storage', isHeading: true),
            SubcategoryItem(title: 'Cupboards'),
            SubcategoryItem(title: 'Bedside Table'),
            SubcategoryItem(title: 'Chest of Drawers'),
            SubcategoryItem(title: 'Dressers and Mirrors'),
            SubcategoryItem(title: 'Modular Wardrobes'),
            SubcategoryItem(title: 'Dining Storage', isHeading: true),
            SubcategoryItem(title: 'Crocery Units'),
            SubcategoryItem(title: 'Kitchen Cabinet & Racks'),
            SubcategoryItem(title: 'Modular Kitchen'),
            SubcategoryItem(title: 'Kids Storage', isHeading: true),
            SubcategoryItem(title: 'Kids Wardrobes'),
            SubcategoryItem(title: 'Kids Beside Tables'),
            SubcategoryItem(title: 'Kids Storage Cabinets'),
            SubcategoryItem(title: 'Kids Chest of Drawers'),
            SubcategoryItem(title: 'Kids BookShelves'),
          ],
           isExpanded: _expandedCategory == 'Storage Furniture',
          onExpansionChanged: () => _toggleCategory('Storage Furniture', 8),
          ),
        ListTile(
          title: const Text('About Us'),
          onTap: () {
            _scrollToCategory(9);
            Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutUsPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Contact Us'),
          onTap: () {
           _scrollToCategory(10);
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactUsPage()),
            );
          },
        ),
        ListTile(
          title: const Text('Log out'),
          onTap: () {
           _scrollToCategory(11);
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
        ),
        ListTile(
          title: const Text('App Intro'),
          onTap: () {
           _scrollToCategory(12);
           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Onboarding()),
            );
          },
        ),
      ],
    );
  }
}
