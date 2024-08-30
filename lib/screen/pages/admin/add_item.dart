import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/constants.dart';

class AddItemPage extends StatefulWidget {
  final List<String> subcategories;

  const AddItemPage({super.key, required this.subcategories});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;
  String? _selectedSubcategory;
  final ImagePicker _picker = ImagePicker();
  
void _pickImage() async {
  final User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('You must be logged in to upload images')),
    );
    return;
  }

  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    setState(() {
      _selectedImage = File(image.path);
    });
  }
}

  Future<String> _uploadImageToStorage(File image) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference storageReference =
        FirebaseStorage.instance.ref().child('furniture_images/$fileName');
    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    return await snapshot.ref.getDownloadURL();
  }
Future<void> _addFurniture() async {
  String imageUrl = '';
  if (_selectedImage != null) {
    try {
      imageUrl = await _uploadImageToStorage(_selectedImage!);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
      return;
    }
  }

  // Retrieve the current user's UID
  final User? user = FirebaseAuth.instance.currentUser;
  final String uid = user?.uid ?? '';

  try {
    await FirebaseFirestore.instance.collection('furnitures').add({
      'name': _nameController.text.trim(),
      'price': double.tryParse(_priceController.text.trim()) ?? 0,
      'description': _descriptionController.text.trim(),
      'subcategory': _selectedSubcategory,
      'imageUrl': imageUrl,
      'createdAt': Timestamp.now(),
      'uid': uid,  // Store the user's UID
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Furniture added successfully')),
    );

    // Clear fields after successful upload
    setState(() {
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _selectedImage = null;
      _selectedSubcategory = null;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to add furniture: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item', style: TextStyle(color: Colors.white)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: _selectedImage == null
                    ? const Icon(Icons.add_a_photo,
                        size: 50, color: Colors.grey)
                    : Image.file(_selectedImage!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedSubcategory,
              hint: const Text('Select Subcategory'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSubcategory = newValue;
                });
              },
              items: widget.subcategories
                  .map<DropdownMenuItem<String>>((String subcategory) {
                return DropdownMenuItem<String>(
                  value: subcategory,
                  child: Text(subcategory),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addFurniture,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Add Item', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
