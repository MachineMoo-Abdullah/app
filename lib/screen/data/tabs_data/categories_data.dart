
import 'package:myapp/screen/data/products/products_data.dart';
import 'package:myapp/screen/pages/sub_category/category_page.dart';




final Map<String, Map<String, List<SubCategory>>> categoryProducts = {
  'Sofa': {
    'Sofa Set': [
      SubCategory(
        imagePath: 'assets/images/products/fabric_sofa_set.jpg',
        title: 'Fabric Sofa Set',
        price: 140.00,
        products: productCategories['Fabric Sofa Set']?? [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/luxury_leather_sofa.jpg',
        title: 'Luxury Leather Sofas',
        price: 180.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/l_shaped_sofa.jpg',
        title: 'Letherette Sofas Sets',
        price: 250.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/leather_sofa_set.jpg',
        title: 'Leather Sofa Set',
        price: 200.00,
        products: productCategories['Leather Sofa Set']?? [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/l_shaped_sofa.jpg',
        title: 'L Shaped Sofa Sets',
        price: 250.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/love_seat.jpg',
        title: 'LoveSeats',
        price: 160.00,
        products: [],
      ),
    ],
    'Seaters Set': [
      SubCategory(
        imagePath: 'assets/images/products/1_seater_sofa.jpg',
        title: '1 Seater Sofa',
        price: 90.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/2_seater_sofa.jpg',
        title: '2 Seater Sofa',
        price: 120.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/3_seater_sofa.jpg',
        title: '3 Seater Sofa',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/sofa_set.jpg',
        title: 'All Sofas',
        price: 300.00,
        products: [],
      ),
    ],
    'Sofa Bed': [
      SubCategory(
        imagePath: 'assets/images/products/sofa_cum_bed.jpg',
        title: 'Sofa Cum Bed',
        price: 160.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/diwan.jpg',
        title: 'Diwans',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/futon.jpg',
        title: 'Futons',
        price: 130.00,
        products: [],
      ),
    ],
    'Seating': [
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Lounge Chairs',
        price: 110.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/accent_chair.jpg',
        title: 'Accent Chairs',
        price: 95.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/stool.jpg',
        title: 'Stools',
        price: 40.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/bench.jpg',
        title: 'Benches',
        price: 75.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/rocking_chair.jpg',
        title: 'Rocking Chairs',
        price: 85.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/gaming_chair.jpg',
        title: 'Gaming Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/chair.jpg',
        title: 'Chairs',
        price: 70.00,
        products: [],
      ),
    ],
  },
  'Living Area': {
    'Tables': [
      SubCategory(
        imagePath: 'assets/images/products/coffee_table.jpg',
        title: 'Coffee Tables',
        price: 100.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/coffee_table.jpg',
        title: 'Side and End Tables',
        price: 120.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/coffee_table.jpg',
        title: 'Console Tables',
        price: 120.00,
        products: [],
      ),
      // Add more subcategories for Table in Living Area
    ],
    'Storage': [
      SubCategory(
        imagePath: 'assets/images/products/shelf.jpg',
        title: 'TV Units',
        price: 80.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/shelf.jpg',
        title: 'Book Shelves',
        price: 80.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/shelf.jpg',
        title: 'Shoe Racks',
        price: 80.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/shelf.jpg',
        title: 'Wall Shelves',
        price: 80.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/shelf.jpg',
        title: 'Living Room Sets',
        price: 80.00,
        products: [],
      ),
      // Add more subcategories for Storage in Living Area
    ],
    'Seating': [
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Lounge Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Accent Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Stools',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Benches',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Rocking Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Gaming Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Chairs',
        price: 150.00,
        products: [],
      ),
      // Add more subcategories for Seating in Living Area
    ],
  },
  'Study': {
    'Tables': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Study Tables',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Computer Tables',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Offics Tables',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Laptop Tables',
        price: 150.00,
        products: [],
      ),
      // Add more subcategories for Tables in Study
    ],
    'Chairs': [
      SubCategory(
        imagePath: 'assets/images/products/study_chair.jpg',
        title: 'Study Chairs',
        price: 90.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Office Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Ergononmic Study Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Gaming Chairs',
        price: 150.00,
        products: [],
      ),
      // Add more subcategories for Chairs in Study
    ],
    'Storage': [
      SubCategory(
        imagePath: 'assets/images/products/book_shelf.jpg',
        title: 'Book Shelves',
        price: 110.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Wall Shelves',
        price: 150.00,
        products: [],
      ),
      // Add more subcategories for Storage in Study
    ],
    'Decor': [
      SubCategory(
        imagePath: 'assets/images/products/study_lamp.jpg',
        title: 'Study Lamps',
        price: 60.00,
        products: [],
      ),
      // Add more subcategories for Decor in Study
    ],
  },
  'Bed Room': {
    'All Beds': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Beds',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Beds with Storage',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Beds Without Storage',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'King Size Beds',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Queen Size Beds',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Single Beds',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Beds Mattress Sets',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Sofa Cum Beds',
        price: 150.00,
       
        products: [],
      ),
      // Add more subcategories for Tables in Study
    ],
    'Mattresses': [
      SubCategory(
        imagePath: 'assets/images/products/study_chair.jpg',
        title: 'All Mattresses',
        price: 90.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'King Size Mattress',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Queen Size Mattress',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Single Bed Mattress',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Mattress by Material',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Mattress by Brand',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Mattress Protectors',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Pillows',
        price: 150.00,
        products: [],
      ),
      // Add more subcategories for Chairs in Study
    ],
    'Storage': [
      SubCategory(
        imagePath: 'assets/images/products/book_shelf.jpg',
        title: 'Wardrobes',
        price: 110.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Beside Tables',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Chest of Drawers',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Dressers & Mirrors',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Modular Wardrobes',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Benches',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Storage Chests',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Bedroom Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Plastic Storage',
        price: 150.00,
        products: [],
      ),
      // Add more subcategories for Storage in Study
    ],
    'Kids Room': [
      SubCategory(
        imagePath: 'assets/images/products/study_lamp.jpg',
        title: 'Kids Beds',
        price: 60.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/study_lamp.jpg',
        title: 'Kids Tables',
        price: 60.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/study_lamp.jpg',
        title: 'Bunk Beds',
        price: 60.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/study_lamp.jpg',
        title: 'Kids Seating',
        price: 60.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/study_lamp.jpg',
        title: 'Kids Decor',
        price: 60.00,
        products: [],
      ),
      // Add more subcategories for Decor in Study
    ],
  },
  'Dining': {
    'Storage': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Crockery Units',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Kitchen Cabinets & Racks',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Modular Kitchen',
        price: 150.00,
        products: [],
      ),
      
    ],
    'Table Set': [
      SubCategory(
        imagePath: 'assets/images/products/study_chair.jpg',
        title: '6 Seater Dining Table Set',
        price: 90.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: '4 Seater Dining Table Set',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: '2 & 3 Seater Dining Table Set',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: '8 Seater Dining Table Set',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Dining Tables',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Dining Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Dining Benches',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'All Dining Table Sets',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Chair Pads',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Folding Small Dining Table Sets',
        price: 150.00,
        products: [],
      ),
    ],
  },
  'Garden': {
    'Balcony & OutDoor': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Balcony Chairs',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Balcony Sets',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Swing Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Outdoor Tables',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Plastic Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Hammocks',
        price: 150.00,
        products: [],
      ),
    ],
  },
  'Office': {
    'Tables': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Reception Desks',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Corner Desks',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'U-Shaped Desks',
        price: 150.00, 
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'L-Shaped Desks',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Executive Desks',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Wall Mounted Desks',
        price: 150.00,
        products: [],
      ),
    ],
    'Seating': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Executive Chairs',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Ergonomic Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Task Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Mesh Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Guest Chairs',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Office Stools',
        price: 150.00,
        products: [],
      ),
    ],
    'Storage': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Book Shelves',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'File Cabinets',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Storage Chests',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Office Wardrobes',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Cabinets',
        price: 150.00,
        products: [],
      ),
    ],
  },
  'HandiCrafts': {
    'Beds': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Reception Desks',
        price: 140.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'Corner Desks',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'U-Shaped Desks',
        price: 150.00,
        products: [],
      ),
      SubCategory(
        imagePath: 'assets/images/products/lounge_chair.jpg',
        title: 'L-Shaped Desks',
        price: 150.00,
        products: [],
      ),
     
    ],
    'Seatings': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Executive Chairs',
        price: 140.00,
        products: [],
      ),
      
    ],
    'Tables': [
      SubCategory(
        imagePath: 'assets/images/products/study_table.jpg',
        title: 'Book Shelves',
        price: 140.00,
        products: [],
      ),
      
    ],
  },
  
};
