import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';// Import HomeScreen
import 'package:myapp/screen/screen.dart';
import 'package:provider/provider.dart';// Adjust the path as necessary
import 'forgot_password.dart';
import 'working_social_icons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Define admin credentials
  final String adminEmail = 'admin@gmail.com';
  final String adminPassword = '123456789';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double padding = size.width * 0.05;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Upside(
                  imgUrl: "assets/images/login_signup/logofurniture.png"),
              const PageTitleBar(title: "Login to your account"),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.3),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        iconButton(context),
                        SizedBox(height: size.height * 0.03),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'OpenSans',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  return null;
                                },
                              ),
                              RoundedPasswordField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 50),
                              RoundedButton(
                                text: 'LOGIN',
                                press: _loginUser,
                              ),
                              const SizedBox(height: 20),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              InkWell(
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordPage(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Check if admin credentials are correct
        if (emailController.text.trim() == adminEmail &&
            passwordController.text.trim() == adminPassword) {
          // Navigate to Admin Page
          if (mounted) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeAdminPage()),
            );
          }
        } else {
          // Proceed with Firebase authentication for non-admin users
          final UserCredential userCredential =
              await _auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          final User? user = userCredential.user;
          if (user != null) {
            String email = user.email ?? '';
            String username = user.displayName ?? '';

            UserModel currentUser = UserModel(email: email, username: username);
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Welcome $username')),
            );
            if (mounted) {
              // Update the user provider
              Provider.of<UserProvider>(context, listen: false)
                  .setUser(currentUser);
              // Navigate to User Home Page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Bottomnavbar()),
              );
              Provider.of<NavigationProvider>(context, listen: false)
                  .setIndex(0);
            }
          }
        }
      } on FirebaseAuthException {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content:
                    Text('Failed to login, email or password is incorrect')),
          );
        }
      }
    }
  }

  // Implement Google Sign-In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);

        final User? user = userCredential.user;
        if (user != null) {
          String email = user.email ?? '';
          String username = user.displayName ?? '';

          UserModel currentUser = UserModel(email: email, username: username);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome $username'),
            ),
          );
          if (mounted) {
            // Update the user provider
            Provider.of<UserProvider>(context, listen: false).setUser(currentUser);
            // Navigate to User Home Page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Bottomnavbar()),
            );
            Provider.of<NavigationProvider>(context, listen: false).setIndex(0);
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to sign in with Google')),
      );
    }
  }

  Widget iconButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RoundedIcon(
          imageUrl: "assets/images/login_signup/facebook.png",
          onTap: () => signInWithFacebook(context),
        ),
        const SizedBox(width: 20),
        RoundedIcon(
          imageUrl: "assets/images/login_signup/google.jpg",
          onTap: () => signInWithGoogle(context), // Connect Google Sign-In here
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
