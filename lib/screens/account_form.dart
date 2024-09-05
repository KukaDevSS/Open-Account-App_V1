// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';
// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/account_info.dart';
import 'package:flutter_app_1/models/address_info.dart';
import 'package:flutter_app_1/models/personal_info.dart';
import 'package:flutter_app_1/providers/account_provider.dart';
import 'package:flutter_app_1/providers/user_provider.dart';
// import 'package:flutter_app_1/providers/user_provider.dart';
import 'package:flutter_app_1/widgets/accountForm_textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class AccountForm extends StatefulWidget {
  const AccountForm({super.key});

  @override
  State<AccountForm> createState() => _AccountFormState();
}

class _AccountFormState extends State<AccountForm> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final fullNameController = TextEditingController();
  final idTypeController = TextEditingController();
  final idOrPassportNoController = TextEditingController();
  // final familyBookNoController = TextEditingController();
  final MaskedTextController dateOfBirthController =
      MaskedTextController(mask: '00-00-0000');
  final villageController = TextEditingController();
  final districtController = TextEditingController();
  final provinceController = TextEditingController();
  final countryController = TextEditingController();
  final phoneNumberController = TextEditingController(text: '020');
  final accountNameController = TextEditingController();

  String? selectedTitle;
  String? selectedAccountType;
  String? selectedOwnershipType;
  String? selectedCurrencyType;
  String? selectedIdType;

  final List<String> titles = [
    'Mr.',
    'Mrs.',
    'Ms.',
  ];

  final List<String> accountTypes = [
    'Current Account',
    'Saving Account',
    'Fixed Deposit Account',
  ];

  final List<String> ownershipTypes = [
    'Individual',
    'Joint Account',
    'Guardians',
  ];

  final List<String> currencyType = [
    'LAK',
    'THB',
    'USD',
    'VND',
  ];

  final List<String> idType = [
    'ID',
    'Passport',
    'Family Book',
  ];

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Image'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDropdownTitleBottomSheet(BuildContext context) async {
    final String? selectedTT = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: titles.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: Center(child: Text(titles[index])),
                onTap: () {
                  Navigator.pop(context, titles[index]);
                },
              ),
            );
          },
        );
      },
    );

    if (selectedTT != null) {
      setState(() {
        selectedTitle = selectedTT;
        titleController.text = selectedTT;
      });
    }
  }

  void _showDropdownAccountTypeBottomSheet(BuildContext context) async {
    final String? selectedAC = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: accountTypes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Column(
                children: [
                  ListTile(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    title: Center(child: Text(accountTypes[index])),
                    onTap: () {
                      Navigator.pop(context, accountTypes[index]);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
    if (selectedAC != null) {
      setState(() {
        selectedAccountType = selectedAC;
        // accountNameController.text = selected;
      });
    }
  }

  void _showDropdownOwnershipTypeBottomSheet(BuildContext context) async {
    final String? selectedOT = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: ownershipTypes.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: Center(child: Text(ownershipTypes[index])),
                onTap: () {
                  Navigator.pop(context, ownershipTypes[index]);
                },
              ),
            );
          },
        );
      },
    );
    if (selectedOT != null) {
      setState(() {
        selectedOwnershipType = selectedOT;
        // accountNameController.text = selected;
      });
    }
  }

  void _showDropdownCurrencyTypeBottomSheet(BuildContext context) async {
    final String? selectedCT = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: currencyType.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: Center(child: Text(currencyType[index])),
                onTap: () {
                  Navigator.pop(context, currencyType[index]);
                },
              ),
            );
          },
        );
      },
    );
    if (selectedCT != null) {
      setState(() {
        selectedCurrencyType = selectedCT;
        // accountNameController.text = selected;
      });
    }
  }

  void _showDropdownIDTypeBottomSheet(BuildContext context) async {
    final String? selectedID = await showModalBottomSheet<String>(
      context: context,
      builder: (BuildContext context) {
        return ListView.builder(
          itemCount: idType.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey[300]!, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                title: Center(child: Text(idType[index])),
                onTap: () {
                  Navigator.pop(context, idType[index]);
                },
              ),
            );
          },
        );
      },
    );
    if (selectedID != null) {
      setState(() {
        selectedIdType = selectedID;
        idTypeController.text = selectedID;
        // accountNameController.text = selected;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    countryController.text = 'Laos';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ເປີດບັນຊີ'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Image(
                          image: AssetImage('assets/images/lvb_logo.png'),
                          width: 150,
                        ),
                      ),
                      Text(
                        'ແບບຟອມສະເໜີເປີດບັນຊີ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'REQUEST FOR ACCOUNT OPENING',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        _showImagePickerDialog(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            _image == null
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 80,
                                    child: Icon(Icons.add_a_photo,
                                        size: 50, color: Colors.grey),
                                  )
                                : Image.file(
                                    _image!,
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                            Text('Upload ID Image'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _showDropdownTitleBottomSheet(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: TextEditingController(text: selectedTitle),
                          decoration: InputDecoration(
                            labelText: 'ແທນນາມ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            suffixIcon: Icon(Icons.arrow_drop_down),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Please select a title' : null,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                AccountFormTextField(
                  controller: fullNameController,
                  hintText: 'ຊື່ ແລະ ນາມສະກູນ',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your full name' : null,
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _showDropdownIDTypeBottomSheet(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller: TextEditingController(text: selectedIdType),
                      decoration: InputDecoration(
                        labelText: 'ເລືອກປະເພດ ID',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please select a id type' : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: idOrPassportNoController,
                    hintText: 'ເລກລະຫັດ ID',
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your ID or passport  number'
                        : null),
                SizedBox(height: 20),
                // AccountFormTextField(
                //     controller: familyBookNoController,
                //     hintText: 'Family Book Number',
                //     validator: (value) => value!.isEmpty
                //         ? 'Please enter your family book number'
                //         : null),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: dateOfBirthController,
                    hintText: 'ວວ-ດດ-ປປ / 09-12-1998',
                    validator: (value) => value!.isEmpty
                        ? 'Please enter your date of birth'
                        : null),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: villageController,
                    hintText: 'ບ້ານ',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your village' : null),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: districtController,
                    hintText: 'ເມືອງ',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your district' : null),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: provinceController,
                    hintText: 'ແຂວງ',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your province' : null),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: countryController,
                    hintText: 'ປະເທດ',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your country' : null),
                SizedBox(height: 20),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: 'ເບີໂທ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your phone number' : null,
                ),
                SizedBox(height: 20),
                AccountFormTextField(
                    controller: accountNameController,
                    hintText: 'ຊື່ບັນຊີ ບໍ່ເກີນ 20 ຕົວອັກສອນ',
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter your account name' : null),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _showDropdownAccountTypeBottomSheet(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller:
                          TextEditingController(text: selectedAccountType),
                      decoration: InputDecoration(
                        labelText: 'ປະເພດບັນຊີ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please select a account type' : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _showDropdownOwnershipTypeBottomSheet(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller:
                          TextEditingController(text: selectedOwnershipType),
                      decoration: InputDecoration(
                        labelText: 'ປະເພດການເປັນເຈົ້າຂອງ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      validator: (value) => value!.isEmpty
                          ? 'Please select a ownership type'
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () => _showDropdownCurrencyTypeBottomSheet(context),
                  child: AbsorbPointer(
                    child: TextFormField(
                      controller:
                          TextEditingController(text: selectedCurrencyType),
                      decoration: InputDecoration(
                        labelText: 'ປະເພດສະກຸນເງິນ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[300]!),
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                      validator: (value) =>
                          value!.isEmpty ? 'Please select a currency type' : null,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final username =
                          await Provider.of<UserProvider>(context, listen: false)
                              .getLoggedInUsername();
                      if (username == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Username not found. Please log in again.')),
                        );
                        return;
                      }
                      String? dateOfBirthISO =
                          convertToISO8601(dateOfBirthController.text);
                      if (dateOfBirthISO == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Invalid date format. Please use DD-MM-YYYY')),
                        );
                        return;
                      }
                      PersonalInfo personalInfo = PersonalInfo(
                        title: selectedTitle!,
                        fullName: fullNameController.text,
                        idType: idTypeController.text,
                        idOrPassportNo: idOrPassportNoController.text,
                        // familyBookNo: familyBookNoController.text,
        
                        dateOfBirth: DateTime.parse(dateOfBirthISO),
                        registeredAddress: Address(
                          village: villageController.text,
                          district: districtController.text,
                          province: provinceController.text,
                          country: countryController.text,
                        ),
                        phoneNumber: phoneNumberController.text,
                        idImage: _image != null ? _image!.path : '',
                      );
        
                      AccountInfo accountInfo = AccountInfo(
                          accountName: accountNameController.text,
                          accountType: selectedAccountType!,
                          typeOfOwnership: selectedOwnershipType!,
                          currency: selectedCurrencyType!,
                          accountStatus: 'processing',
                          created_at: DateTime.now().toIso8601String(),
                          created_by: username);
        
                      try {
                        print('Attempting to send account data...');
                        await Provider.of<AccountProvider>(context, listen: false)
                            .sendAccountData(
                                personalInfo, accountInfo, _image, context);
                        print('Account data sent successfully');
                      } catch (error) {
                        print('Error occurred: $error');
                      }
        
                      print('Personal Info: ${personalInfo.toJson()}');
                      print('Account Info: ${accountInfo.toJson()}');
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'ສຳເລັດ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue[900],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? convertToISO8601(String date) {
  try {
    final inputFormat = DateFormat('dd-MM-yyyy');
    final outputFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');
    final parsedDate = inputFormat.parse(date);
    final localDate =
        DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

    return outputFormat.format(localDate) + 'Z';
  } catch (e) {
    return null;
  }
}
