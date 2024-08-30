class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Quality Products',
    image: 'assets/images/login_signup/quality.png',
    description: "Discover unmatched quality in our furniture, where durable, timeless designs ensure beauty and comfort for years to come.",
  ),
  OnboardingContent(
    title: 'Fast Delivery',
    image: 'assets/images/login_signup/delivery.png',
    description: "Fast, free delivery with every order—your furniture arrives quickly, ready to transform your space at no extra cost.",
  ),
  OnboardingContent(
    title: 'Custom Creations, Just for You',
    image: 'assets/images/login_signup/creation.png',
    description: "Contact us to craft furniture tailored to your style—your dream design is just a request away!",
  ),
];

