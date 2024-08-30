import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/constants.dart';

class UpdateItemPage extends StatefulWidget {
  final List<String> subcategories;

  const UpdateItemPage({super.key, required this.subcategories});

  @override
  _UpdateItemPageState createState() => _UpdateItemPageState();
}

class _UpdateItemPageState extends State<UpdateItemPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _selectedImage;
  String? _selectedSubcategory;
  String? _docId;
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> _loadFurnitureData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('furnitures')
          .where('name', isEqualTo: _nameController.text.trim())
          .where('subcategory', isEqualTo: _selectedSubcategory)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot document = querySnapshot.docs.first;
        _docId = document.id;
        setState(() {
          _nameController.text = document['name'];
          _priceController.text = document['price'].toString();
          _descriptionController.text = document['description'];
          _selectedSubcategory = document['subcategory'];
          // Optionally set the image if you have an image URL
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('No documents found for the given query.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
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

  Future<void> _updateFurniture() async {
    if (_docId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No furniture item selected for update')),
      );
      return;
    }

    final User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('You must be logged in to update furniture')),
      );
      return;
    }

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

    try {
      Map<String, dynamic> updatedData = {
        'name': _nameController.text.trim(),
        'price': double.tryParse(_priceController.text.trim()) ?? 0,
        'description': _descriptionController.text.trim(),
        'subcategory': _selectedSubcategory,
        'updatedAt': Timestamp.now(),
        'uid': user.uid,
      };

      if (imageUrl.isNotEmpty) {
        updatedData['imageUrl'] = imageUrl;
      }

      await FirebaseFirestore.instance
          .collection('furnitures')
          .doc(_docId)
          .update(updatedData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Furniture updated successfully')),
      );

      // Clear fields after successful operation
      setState(() {
        _nameController.clear();
        _priceController.clear();
        _descriptionController.clear();
        _selectedImage = null;
        _selectedSubcategory = null;
        _docId = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update furniture: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Item', style: TextStyle(color: Colors.white)),
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
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
              onPressed: _loadFurnitureData,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Load Data', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
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
                    ? const Icon(Icons.add_a_photo, size: 50, color: Colors.grey)
                    : Image.file(_selectedImage!, fit: BoxFit.cover),
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
            ElevatedButton(
              onPressed: _updateFurniture,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Update Item', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
