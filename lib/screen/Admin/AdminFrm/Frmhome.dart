import 'dart:io';
import 'package:flutter/material.dart';
import 'package:krishiyan_admin/screen/Admin/AdminFrm/EditFpoScreen.dart';
import 'package:krishiyan_admin/screen/Admin/AdminFrm/Seefarmers.dart'; // Make sure to import the correct path for SeeFarmersScreen

class Frmhome extends StatefulWidget {
  const Frmhome({super.key});

  @override
  State<Frmhome> createState() => _FrmhomeState();
}

class _FrmhomeState extends State<Frmhome> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedEntity = 'Farmer producer Organization';
  List<String> _entities = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FRM Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Type of entity',
                border: OutlineInputBorder(),
              ),
              items: _entities.isEmpty
                  ? null
                  : [
                      DropdownMenuItem(
                        value: 'Select an Entity',
                        child: Text('Select an Entity'),
                      )
                    ].followedBy(_entities.map((entity) {
                      return DropdownMenuItem(
                        value: entity,
                        child: Text(entity),
                      );
                    })).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedEntity = value ?? 'Select an Entity';
                });
              },
              value: _selectedEntity,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search By',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
            SizedBox(height: 24),
            Text(
              'FPO LIST',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _entities.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://picsum.photos/200/300'),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_entities[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('Maharastra',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Text('9876543210',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditFpoScreen()),
                                  );
                                },
                                child: Text('Edit FPO'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SeeFarmersScreen(fpoIndex: index)),
                                  );
                                },
                                child: Text('See Farmers'),
                              ),
                            ],
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
}
