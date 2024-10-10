import 'package:flutter/material.dart';

class SeeFarmersScreen extends StatefulWidget {
  final int fpoIndex;

  const SeeFarmersScreen({Key? key, required this.fpoIndex}) : super(key: key);

  @override
  _SeeFarmersScreenState createState() => _SeeFarmersScreenState();
}

class _SeeFarmersScreenState extends State<SeeFarmersScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> farmers = [
    {
      'name': 'John Doe',
      'state': 'Maharashtra',
      'mobileNumber': '9876543210',
      'profilePicture': 'https://picsum.photos/200/300'
    },
    {
      'name': 'Jane Smith',
      'state': 'Karnataka',
      'mobileNumber': '1234567890',
      'profilePicture': 'https://picsum.photos/200/301'
    },
    // Add more farmer details here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('See Farmers for FPO ${widget.fpoIndex + 1}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search By',
                hintText: 'Name or Mobile Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _showRegistrationOptions,
              child: Text('Register Farmer'),
            ),
            SizedBox(height: 24),
            Text(
              'Farmer List',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: farmers.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                farmers[index]['profilePicture'] ?? ''),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(farmers[index]['name'] ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EditFarmerDetailsScreen(
                                                    index: index,
                                                    fpoIndex: widget.fpoIndex,
                                                  )),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Text('State: ${farmers[index]['state'] ?? ''}'),
                                SizedBox(height: 8),
                                Text(
                                    'Mobile Number: ${farmers[index]['mobileNumber'] ?? ''}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRegistrationOptions() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('FARMER REGISTRATION'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => _navigateToUploadSingleFarmer(),
                child: Text('Upload Single Farmer'),
              ),
              SizedBox(height: 8),
              Text('Or'),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _downloadCsvSample(),
                child: Text('Download .csv Sample File'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _navigateToImportCsv(),
                child: Text('Import .csv file'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _navigateToUploadSingleFarmer() {
    // Implement navigation to upload single farmer screen
    print('Navigating to Upload Single Farmer');
  }

  void _downloadCsvSample() {
    // Implement downloading csv sample file
    print('Downloading CSV sample file');
  }

  void _navigateToImportCsv() {
    // Implement navigation to import csv screen
    print('Navigating to Import CSV');
  }
}

// Define the EditFarmerDetailsScreen class separately
class EditFarmerDetailsScreen extends StatelessWidget {
  final int index;
  final int fpoIndex;

  const EditFarmerDetailsScreen(
      {Key? key, required this.index, required this.fpoIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implementation here
    return Scaffold(
      appBar: AppBar(title: Text('Edit Farmer Details')),
      body: Center(
          child:
              Text('Edit Farmer Details for Index $index and FPO $fpoIndex')),
    );
  }
}
