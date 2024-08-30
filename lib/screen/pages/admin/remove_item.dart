import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/constants.dart';

class RemoveItemPage extends StatefulWidget {
  final List<String> subcategories;

  const RemoveItemPage({super.key, required this.subcategories});

  @override
  _RemoveItemPageState createState() => _RemoveItemPageState();
}

class _RemoveItemPageState extends State<RemoveItemPage> {
  final TextEditingController _nameController = TextEditingController();
  String? _selectedSubcategory;
  String? _docId;

  void _loadFurnitureData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('furnitures')
          .where('name', isEqualTo: _nameController.text.trim())
          .where('subcategory', isEqualTo: _selectedSubcategory)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        _docId = querySnapshot.docs.first.id;
        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No documents found for the given query.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  Future<void> _removeFurniture() async {
    if (_docId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No furniture item selected for removal')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('furnitures').doc(_docId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Furniture removed successfully')),
      );

      // Clear fields after successful operation
      setState(() {
        _nameController.clear();
        _selectedSubcategory = null;
        _docId = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to remove furniture: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove Item', style: TextStyle(color: Colors.white)),
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
              onPressed: () {
                _loadFurnitureData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Load Furniture', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _removeFurniture,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: const Text('Remove Item', style: TextStyle(fontSize: 18,color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
