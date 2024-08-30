import 'package:myapp/screen/screen.dart';

import '../widgets/input_fields.dart';

class ContactDetailsCard extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phone1Controller;
  final TextEditingController phone2Controller;

  const ContactDetailsCard({
    Key? key,
    required this.nameController,
    required this.phone1Controller,
    required this.phone2Controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Icon(Icons.phone, color: kPrimaryColor),
                SizedBox(width: 10.0),
                Text(
                  'Contact Details',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            CustomInputField(
              label: 'Name',
              hintText: 'Enter your name',
              controller: nameController,
            ),
            SizedBox(height: 10.0),
            CustomInputField(
              label: 'Phone Number 1',
              hintText: 'Enter phone number',
              keyboardType: TextInputType.phone,
              controller: phone1Controller,
            ),
            SizedBox(height: 10.0),
            CustomInputField(
              label: 'Phone Number 2 (Optional)',
              hintText: 'Enter phone number',
              keyboardType: TextInputType.phone,
              controller: phone2Controller,
            ),
          ],
        ),
      ),
    );
  }
}

