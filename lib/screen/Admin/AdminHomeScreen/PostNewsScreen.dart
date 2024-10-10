import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class PostNewsScreen extends StatefulWidget {
  @override
  _PostNewsScreenState createState() => _PostNewsScreenState();
}

class _PostNewsScreenState extends State<PostNewsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  File? _image;
  bool _isLoading = false;

  // List<BottomNavigationBarItem> bottomItems = [
  //   BottomNavigationBarItem(
  //       icon: Image.asset('assets/images/bottom1.png', width: 25, height: 25),
  //       label: 'Home'),
  //   BottomNavigationBarItem(
  //       icon: Image.asset('assets/images/bottom2.png', width: 25, height: 25),
  //       label: 'Farm'),
  //   BottomNavigationBarItem(
  //       icon: Image.asset('assets/images/bottom3.png', width: 25, height: 25),
  //       label: 'Crop'),
  //   BottomNavigationBarItem(
  //       icon: Image.asset('assets/images/bottom4.png', width: 25, height: 25),
  //       label: 'Profile'),
  // ];

  Future<void> _selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        _image = null;
      }
    });
  }

  void _postNews() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate posting news (replace with actual API call)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      // Clear form fields after posting
      _titleController.clear();
      _descriptionController.clear();
      _priorityController.clear();
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/loginLogo.png', width: 150, height: 60),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 5.0, top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('assets/images/language.png',
                      width: 35, height: 35),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'POST NEWS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title of the news',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _descriptionController,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Description of the news',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _selectImage,
              child: Text(_image != null ? 'Change Image' : 'Upload Image'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _priorityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Priority',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _isLoading ? null : _postNews,
                child: Text(_isLoading ? 'Posting...' : 'POST NEWS'),
              ),
            ),
          ],
        ),
      ),
      //   bottomNavigationBar: Container(
      //     height: 65,
      //     decoration: BoxDecoration(
      //       color: Color.fromARGB(255, 26, 17, 17),
      //       borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(30.0),
      //         topRight: Radius.circular(30.0),
      //       ),
      //       boxShadow: [
      //         BoxShadow(
      //           offset: Offset(0, 5),
      //           blurRadius: 2,
      //           spreadRadius: 0.8,
      //           color: Colors.white,
      //         ),
      //       ],
      //     ),
      //     // child: ClipRRect(
      //     //   borderRadius: BorderRadius.only(
      //     //     topLeft: Radius.circular(30.0),
      //     //     topRight: Radius.circular(30.0),
      //     //   ),
      //       // child: BottomNavigationBar(
      //       //   currentIndex: 0,
      //       //   onTap: (index) {},
      //       //   selectedItemColor: Colors.green,
      //       //   unselectedItemColor: Colors.grey,
      //       //   // items: bottomItems,
      //       //   type: BottomNavigationBarType.fixed,
      //       // ),
      //     ),
      //   ),
    );
  }
}
