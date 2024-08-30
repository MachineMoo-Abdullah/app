import 'package:flutter/material.dart';
import 'package:myapp/screen/pages/user/address/widgets/input_fields.dart';

class AddressDetailsCard extends StatelessWidget {
  final TextEditingController cityController;
  final TextEditingController blockController;
  final TextEditingController streetController;
  final TextEditingController completeAddressController;
  final TextEditingController famousPlaceController;

  AddressDetailsCard({
    Key? key,
    required this.cityController,
    required this.blockController,
    required this.streetController,
    required this.completeAddressController,
    required this.famousPlaceController,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green),
                  SizedBox(width: 10.0),
                  Text(
                    'Address Details',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'City',
                  hintText: 'Select city',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                items: <String>[
                  'Karachi',
                  'Lahore',
                  'Islamabad',
                  'Rawalpindi',
                  'Faisalabad',
                  'Multan',
                  'Peshawar',
                  'Quetta',
                  'Hyderabad',
                  'Sialkot',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a city';
                  }
                  return null;
                },
                onChanged: (value) {
                  cityController.text = value ?? '';
                },
              ),
              const SizedBox(height: 10.0),
              CustomInputField(
                label: 'Block/Sector/Area Name',
                hintText: 'Enter block/sector/area name',
                controller: blockController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter block/sector/area name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              CustomInputField(
                label: 'Street',
                hintText: 'Enter street',
                controller: streetController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the street';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              CustomInputField(
                label: 'Complete Address',
                hintText: 'Enter complete address',
                maxLines: 3,
                controller: completeAddressController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the complete address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 11.0),
              CustomInputField(
                label: 'Famous Place (Optional)',
                hintText: 'Enter famous place (optional)',
                controller: famousPlaceController,
              ),
              const SizedBox(height: 20.0),
             
            ],
          ),
        ),
      ),
    );
  }
}
