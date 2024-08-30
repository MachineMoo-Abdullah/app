class BannerImagesManager {
  final Map<String, Map<String, String>> _categoryBannerImages = {
    'Living Area': {
      'Storage': 'assets/images/banner/living/livingareachair1.jpeg',
      'Table': 'assets/images/banner/living/livingareatable.jpg',
      'Seating': 'assets/images/banner/living/livingareasofa.jpg',
    },
    'Bed Room': {
      'Mattresses': 'assets/images/banner/bedroom/bedroomcupboard.jpg',
      'All Beds': 'assets/images/banner/bedroom/bedroombed.jpg',
      'Storage': 'assets/images/banner/bedroom/bedroomchair.jpg',
      'Kids Room': 'assets/images/banner/bedroom/bedroomsofa.jpg',
    },
    'Study': {
      'Tables': 'assets/images/banner/bedroom/bedroomcupboard.jpg',
      'Chairs': 'assets/images/banner/bedroom/bedroombed.jpg',
      'Storage': 'assets/images/banner/bedroom/bedroomchair.jpg',
      'Decor': 'assets/images/banner/bedroom/bedroomsofa.jpg',
    },
    'Garden': {
      'Chairs': 'assets/images/banner/garden/gardenchair.jpg',
      'Tables': 'assets/images/banner/garden/gardentable.jpg',
      'Swing Chair': 'assets/images/banner/garden/gardensofas.jpg',
    },
    'Office': {
      'Desk': 'assets/images/banner/office/officetable.jpg',
      'Chair': 'assets/images/banner/office/officechair.jpg',
      'Sofa': 'assets/images/banner/office/officesofa.jpg',
    },
    'Dining': {
      'Tables': 'assets/images/banner/dining/diningareatable.jpg',
      'Chairs': 'assets/images/banner/dining/diningareachair.jpg',
      'Storage': 'assets/images/banner/dining/diningareacabinet.jpg',
    },
    'Ancient': {
      'Table': 'assets/images/banner/ancient/ancienttable.jpg',
      'Chair': 'assets/images/banner/ancient/ancientchair.jpg',
      'Sofa': 'assets/images/banner/ancient/ancientsofa.jpg',
      'Bed': 'assets/images/banner/ancient/ancientbed.jpg',
    },
  };

  List<String> getBannerImages(String category, List<String> items) {
    final itemMap = _categoryBannerImages[category];

    if (itemMap == null) {
      return [];
    }

    final paths = items.map((item) {
      if (!itemMap.containsKey(item)) {
        return '';
      }
      return itemMap[item]!;
    }).where((path) => path.isNotEmpty).toList();

    return paths;
  }
}
