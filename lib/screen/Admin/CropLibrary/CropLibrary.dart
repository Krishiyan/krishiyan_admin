import 'package:flutter/material.dart';
import 'package:krishiyan_admin/localization/AppLocalizations.dart';

class CropLibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  buildTranslate("cropLibrary")!,
                  softWrap: true,
                  style: const TextStyle(
                      color: Color(0xFF3FC041),
                      fontSize: 20,
                      fontFamily: 'poppins-medium'),
                ),
              ),
              Text(
                'Select The Crop',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButtonFormField<String>(
                value: 'Maize', // Initial selected value
                items: <String>['Maize', 'Rice', 'Wheat', 'Cotton']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle SUBMIT button click
                },
                child: Text('SUBMIT'),
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle General Information button click
                    },
                    child: Text('General Information'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Varieties button click
                    },
                    child: Text('Varieties'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Pre-sowing practices button click
                    },
                    child: Text('Pre-sowing practices'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Nutrient Management button click
                    },
                    child: Text('Nutrient Management'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Crop Protection button click
                    },
                    child: Text('Crop Protection'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Irrigation Management button click
                    },
                    child: Text('Irrigation Management'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle harvest button click
                    },
                    child: Text('Harvest'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle FAQ button click
                    },
                    child: Text('FAQ'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
