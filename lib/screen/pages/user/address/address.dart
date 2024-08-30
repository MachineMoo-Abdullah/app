import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/screen/screen.dart';

import 'address_contents.dart';

class ContainerPage extends StatelessWidget {
  // Define controllers here
  final _nameController = TextEditingController();
  final _phone1Controller = TextEditingController();
  final _phone2Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _blockController = TextEditingController();
  final _streetController = TextEditingController();
  final _completeAddressController = TextEditingController();
  final _famousPlaceController = TextEditingController();

  ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'Details',
          style: GoogleFonts.roboto(color: Colors.white,fontSize:22,fontWeight:FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: ContainerContents(
          // Pass controllers to child widget
          nameController: _nameController,
          phone1Controller: _phone1Controller,
          phone2Controller: _phone2Controller,
          cityController: _cityController,
          blockController: _blockController,
          streetController: _streetController,
          completeAddressController: _completeAddressController,
          famousPlaceController: _famousPlaceController,
        ),
      ),
    );
  }
}

// Controllers for each input field




