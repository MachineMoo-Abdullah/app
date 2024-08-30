import 'package:myapp/screen/screen.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});
  Color getDarkerColor(Color color) {
  return color.withOpacity(0.7); // Adjust as needed for your design
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        final currentIndex = navigationProvider.currentIndex;

        return Scaffold(
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0 ? getDarkerColor(Colors.black) : const Color.fromARGB(176, 255, 255, 255),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.category_outlined,
                  color: currentIndex == 1 ? getDarkerColor(Colors.black) : const Color.fromARGB(176, 255, 255, 255),
                ),
                label: 'Categories',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: currentIndex == 2 ? getDarkerColor(Colors.black) : const Color.fromARGB(176, 255, 255, 255),
                ),
                label: 'Orders',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: currentIndex == 3 ? getDarkerColor(kPrimaryColor) : const Color.fromARGB(176, 255, 255, 255),
                ),
                label: 'Profile',
              ),
            ],
            selectedIndex: currentIndex,
            onDestinationSelected: (int index) {
              navigationProvider.setIndex(index);
            },
            height: 60,
            backgroundColor: kPrimaryColor,
            elevation: 4,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          ),
          body: _getPage(currentIndex),
        );
      },
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return const CategoriesScreen();
      case 2:
        return const Order();
      case 3:
        return const ProfilePage();
      default:
        return HomeScreen(); // Default case
    }
  }
}
