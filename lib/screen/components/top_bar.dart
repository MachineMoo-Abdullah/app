import 'package:myapp/screen/screen.dart'; // Import your necessary files

class EllipticalSearchBar extends StatelessWidget {
  final String pageName; // Page name passed as a parameter
  final bool showDrawer; // Whether to show the drawer icon
  final bool showBackButton; // Whether to show the back button

  const EllipticalSearchBar({
    super.key,
    required this.pageName,
    this.showDrawer = false, // Default to not show the drawer icon
    this.showBackButton = false, // Default to not show the back button
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.height * 0.15, // Increased height for the new row
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [kPrimaryColor, Colors.brown],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 40.0,
                  ),
                ],
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(size.width, 100.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: size.width * 0.05),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Row(
                    children: [
                      if (showBackButton)
                        InkWell(
                          onTap: () {
                            Navigator.pop(context); // Go back to the previous screen
                          },
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        )
                      else if (showDrawer)
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer(); // Open the drawer
                          },
                          child: const Icon(Icons.menu, color: Colors.white),
                        ),
                      if (showBackButton || showDrawer) const SizedBox(width: 10.0),
                      Text(
                        pageName,
                        style: AppWidget.boldTextFieldStyle().copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05), // Space for the search bar
          ],
        ),
        Positioned(
          top: size.height * 0.1, // Adjust position as needed
          left: size.width * 0.05,
          right: size.width * 0.05,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: InputBorder.none,
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
