import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class EditFpoScreen extends StatefulWidget {
  const EditFpoScreen({Key? key}) : super(key: key);

  @override
  State<EditFpoScreen> createState() => _EditFpoScreenState();
}

class _EditFpoScreenState extends State<EditFpoScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _incorporationDateController =
      TextEditingController();
  final TextEditingController _promoterNameController = TextEditingController();
  final TextEditingController _promoterDesignationController =
      TextEditingController();
  final TextEditingController _registrationNumberController =
      TextEditingController();
  final TextEditingController _cbboController = TextEditingController();
  final TextEditingController _officeContactNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  File? _profilePicture;
  bool _isLoading = false;

  Future<void> _selectProfilePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _profilePicture = File(image.path);
      } else {
        _profilePicture = null;
      }
    });
  }

  void _updateFPO() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate updating FPO (replace with actual API call)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      // Clear form fields after updating
      _nameController.clear();
      _typeController.clear();
      _incorporationDateController.clear();
      _promoterNameController.clear();
      _promoterDesignationController.clear();
      _registrationNumberController.clear();
      _cbboController.clear();
      _officeContactNumberController.clear();
      _emailController.clear();
      _profilePicture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit FPO')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildProfilePicture(),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter FPO name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                items: [
                  'Farmer producer Organization',
                  'Farmer Producer Company',
                  'Primary Agricultural credit society',
                  'Co-operatives',
                  'Farmer interested groups',
                  'Trader',
                  'Retailer',
                  'Exporter',
                  'Importer',
                  'Wholesaler',
                  'Grading / Sorting',
                  'Dal Mills',
                  'Processors'
                ].map((entity) {
                  return DropdownMenuItem(
                    value: entity,
                    child: Text(entity),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _typeController.text = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select an entity type';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _incorporationDateController,
                decoration: InputDecoration(labelText: 'Incorporation Date'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter incorporation date';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _promoterNameController,
                decoration: InputDecoration(labelText: 'Promoter Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter promoter name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _promoterDesignationController,
                decoration: InputDecoration(labelText: 'Promoter Designation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter promoter designation';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _registrationNumberController,
                decoration: InputDecoration(labelText: 'Registration Number'),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 12,
                validator: (value) {
                  if (value == null || value.length != 11) {
                    return 'Please enter a valid registration number (11 digits)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _cbboController,
                decoration: InputDecoration(labelText: 'CBBO'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter CBBO';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _officeContactNumberController,
                decoration: InputDecoration(labelText: 'Office Contact Number'),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                maxLength: 10,
                validator: (value) {
                  if (value == null || value.length != 10) {
                    return 'Please enter a valid phone number (10 digits)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // await _updateFPO();
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(content: Text('FPO updated successfully')),
                    // );
                  }
                },
                child: Text(_isLoading ? 'Updating...' : 'Update FPO'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Stack(
      children: [
        CircleAvatar(
            radius: 60,
            backgroundImage: _profilePicture != null
                ? NetworkImage('https://picsum.photos/200/300')
                : null),
        Positioned(
          bottom: 0,
          right: 0,
          child: IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _selectProfilePicture,
          ),
        ),
      ],
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
}
