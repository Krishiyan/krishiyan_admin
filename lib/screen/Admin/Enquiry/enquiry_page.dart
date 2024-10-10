import 'package:flutter/material.dart';
import 'package:krishiyan_admin/screen/Admin/Enquiry/enquiry_detail_page.dart';

class EnquiryPage extends StatefulWidget {
  @override
  _EnquiryPageState createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  final TextEditingController _searchController = TextEditingController();
  String? _selectedCommodity;

  List<Map<String, dynamic>> enquiries = [
    {
      'fpoName': 'FPO 1',
      'farmerName': 'John Doe',
      'purpose': 'To Buy',
      'quantity': '100 Ton',
      'location': 'Village XYZ, District ABC',
      'price': '25000',
    },
    // Add more enquiries here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquiries'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search By',
                hintText: 'Enter keyword',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedCommodity,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCommodity = newValue;
                });
              },
              decoration: InputDecoration(
                labelText: 'Select Commodity',
                border: OutlineInputBorder(),
              ),
              items: ['Paddy', 'Wheat', 'Soybean'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement submit functionality here
                print('Submit button pressed');
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 24), // Space between button and cards
            Expanded(
              // This allows the ListView to take up remaining space
              child: ListView.builder(
                itemCount: enquiries.length,
                itemBuilder: (context, index) {
                  return EnquiryCard(enquiries[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnquiryCard extends StatelessWidget {
  final Map<String, dynamic> enquiry;

  EnquiryCard(this.enquiry);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FPO Name: ${enquiry['fpoName']}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EnquiryDetailPage(enquiry: enquiry)),
                    );
                  },
                  child: Text('More Details'),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Farmer Name: ${enquiry['farmerName']}'),
            SizedBox(height: 4),
            Text('Purpose: ${enquiry['purpose']}'),
            SizedBox(height: 4),
            Text('Quantity: ${enquiry['quantity']}'),
            SizedBox(height: 4),
            Text('Location: ${enquiry['location']}'),
            SizedBox(height: 4),
            Text('Price: ${enquiry['price']}'),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement delete functionality
                    print('Delete pressed');
                  },
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement call now functionality
                    print('Call Now pressed');
                  },
                  child: Text('Call Now'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement accept functionality
                    print('Accept pressed');
                  },
                  child: Text('Accept'),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
