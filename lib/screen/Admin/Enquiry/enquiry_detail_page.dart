import 'package:flutter/material.dart';

class EnquiryDetailPage extends StatefulWidget {
  final Map<String, dynamic> enquiry;

  EnquiryDetailPage({required this.enquiry});

  @override
  _EnquiryDetailPageState createState() => _EnquiryDetailPageState();
}

class _EnquiryDetailPageState extends State<EnquiryDetailPage> {
  late TextEditingController _fpoController;
  late TextEditingController _farmerController;
  late TextEditingController _purposeController;
  late TextEditingController _quantityController;
  late TextEditingController _locationController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();

    _fpoController = TextEditingController(text: widget.enquiry['fpoName']);
    _farmerController =
        TextEditingController(text: widget.enquiry['farmerName']);
    _purposeController = TextEditingController(text: widget.enquiry['purpose']);
    _quantityController =
        TextEditingController(text: widget.enquiry['quantity']);
    _locationController =
        TextEditingController(text: widget.enquiry['location']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Enquiry')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _fpoController,
              decoration: InputDecoration(labelText: 'FPO Name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _farmerController,
              decoration: InputDecoration(labelText: 'Farmer Name'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _purposeController,
              decoration: InputDecoration(labelText: 'Purpose'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 16),
            SizedBox(height: 8),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement save changes functionality
                print('Save Changes pressed');
              },
              child: Text('Save Changes'),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Go back to EnquiryPage
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
