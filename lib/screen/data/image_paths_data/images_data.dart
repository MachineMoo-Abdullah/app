class Category {
  final String imagePath;
  final String label;

  Category({required this.imagePath, required this.label});
}

final List<Category> categories = [
  Category(imagePath: "assets/images/home_images/sofa.png", label: "Sofa"),
  Category(imagePath: "assets/images/home_images/living.png", label: "Living Area"),
  Category(imagePath: "assets/images/home_images/hotel.png", label: "Bed Room"),
  Category(imagePath: "assets/images/home_images/studying.png", label: "Study"),
  Category(imagePath: "assets/images/home_images/garden.png", label: "Garden"),
  Category(imagePath: "assets/images/home_images/workplace.png", label: "Office"),
  Category(imagePath: "assets/images/home_images/dining.png", label: "Dining"),
  Category(imagePath: "assets/images/home_images/ancient.png", label: "Ancient"),
  Category(imagePath: "assets/images/home_images/handicrafts.png", label: "HandiCrafts"),
];

final Map<String, List<String>> bannerImagePaths = {
  "Sofa": ['assets/images/categories/sofa.jpg'],
  "Living Area": ['assets/images/categories/livingarea.jpg'],
  "Bed Room": ['assets/images/categories/bedroom.jpg'],
  "Study": ['assets/images/categories/study.jpg'],
  "Garden": ['assets/images/categories/garden.jpg'],
  "Office": ['assets/images/categories/office.jpg'],
  "Dining": ['assets/images/categories/diningarea.jpg'],
  "Ancient": ['assets/images/categories/ancientfurniture.jpg'],
  "HandiCrafts": ['assets/images/categories/handicraft.jpg']
};