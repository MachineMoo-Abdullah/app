import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Ensure this dependency is in your pubspec.yaml

import '../../../constants.dart'; // Import your constants if needed

// Define your ContactUsPage class
class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  // Method to launch WhatsApp
  Future<void> _launchWhatsApp() async {
    const phoneNumber = '+923495430653'; // Replace with your WhatsApp phone number
    final message = Uri.encodeComponent('Hello, I need assistance with your app.');
    final url = 'https://wa.me/$phoneNumber?text=$message';

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Method to send an email
  Future<void> _launchEmail() async {
    const email = 'abdullahprivate1@gmail.com'; // Replace with your email address
    final subject = Uri.encodeComponent('Inquiry about your app');
    final body = Uri.encodeComponent('Hello,\n\nI would like to know more about your app.\n\nBest regards,');
    final url = 'mailto:$email?subject=$subject&body=$body';

    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700),
        ),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Contact Us',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'We are here to assist you.If you want a furniture with unique design or If you have any questions or need help, feel free to reach out to us via WhatsApp or email.',
              style: TextStyle(fontSize: 16, fontFamily:"OpenSans"),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _launchWhatsApp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Use your primary color
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/login_signup/whatsapp.png', // Replace with your WhatsApp icon path
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Chat with Us on WhatsApp',
                      style: TextStyle(fontSize: 16,color:Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _launchEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Use your primary color
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Send Us an Email',
                      style: TextStyle(fontSize: 16,color:Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
