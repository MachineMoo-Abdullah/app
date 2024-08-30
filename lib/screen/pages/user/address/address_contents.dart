import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screen/screen.dart';

import 'cards/address_details_card.dart';
import 'cards/contact_detail_card.dart';

class ContainerContents extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phone1Controller;
  final TextEditingController phone2Controller;
  final TextEditingController cityController;
  final TextEditingController blockController;
  final TextEditingController streetController;
  final TextEditingController completeAddressController;
  final TextEditingController famousPlaceController;

  // GlobalKey for the Form
  final _formKey = GlobalKey<FormState>();

  ContainerContents({
    Key? key,
    required this.nameController,
    required this.phone1Controller,
    required this.phone2Controller,
    required this.cityController,
    required this.blockController,
    required this.streetController,
    required this.completeAddressController,
    required this.famousPlaceController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Assign the form key
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ContactDetailsCard(
            nameController: nameController,
            phone1Controller: phone1Controller,
            phone2Controller: phone2Controller,
          ),
          const SizedBox(height: 20.0),
          AddressDetailsCard(
            cityController: cityController,
            blockController: blockController,
            streetController: streetController,
            completeAddressController: completeAddressController,
            famousPlaceController: famousPlaceController,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Perform database operation using the controllers' text
                final contactName = nameController.text;
                final phone1 = phone1Controller.text;
                final phone2 = phone2Controller.text;
                final city = cityController.text;
                final block = blockController.text;
                final street = streetController.text;
                final completeAddress = completeAddressController.text;
                final famousPlace = famousPlaceController.text;

                // For demonstration purposes, printing to the console
                print(contactName);
                print(phone1);
                print(phone2);
                print(city);
                print(block);
                print(street);
                print(completeAddress);
                print(famousPlace);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Address Added Successfully')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please fill in all required fields')),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor, 
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Save Address',
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 18,fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
