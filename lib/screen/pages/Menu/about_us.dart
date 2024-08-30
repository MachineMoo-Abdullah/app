import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure this dependency is in your pubspec.yaml

import '../../../constants.dart';

// Define your AboutUsPage class
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  // Method to launch URLs
  Future<void> _launchURL(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width

    // Define a base size for icons
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            const Text(
              'About Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Welcome to our furniture app! We are a dedicated team passionate about providing the best furniture options for you.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Meet Our Team:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: Icon(Icons.person), // Replace with person icon if needed
              title: Text('Ahmed'),
              subtitle: Text('Co-Founder'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Ahmed Abdullah'),
              subtitle: Text('Co-Founder'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Abdullah'),
              subtitle: Text('Business Manager'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Our Business:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'We own a business of furniture in Pakistan, and we are committed to delivering quality products to our customers. Our app offers a wide range of furniture options, and you can trust us to provide you with the best products and service.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Contact Us:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'If you have any questions or need assistance, feel free to reach out to us through the app or contact us at info@furnitureapp.com.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Follow Us:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/login_signup/instagram.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () => _launchURL('https://www.instagram.com/yourusername'),
                  tooltip: 'Instagram',
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/login_signup/facebook.png',
                    width: 40,
                    height: 40,
                  ),
                  onPressed: () => _launchURL('https://www.facebook.com/yourusername'),
                  tooltip: 'Facebook',
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/login_signup/tiktok.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () => _launchURL('https://www.tiktok.com/@yourusername'),
                  tooltip: 'TikTok',
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/login_signup/youtube.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () => _launchURL('https://www.youtube.com/channel/yourchannelid'),
                  tooltip: 'YouTube',
                ),
                IconButton(
                  icon: Image.asset(
                    'assets/images/login_signup/linkedin.png',
                    width: 30,
                    height: 30,
                  ),
                  onPressed: () => _launchURL('https://www.linkedin.com/in/yourusername'),
                  tooltip: 'LinkedIn',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}