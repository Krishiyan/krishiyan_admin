import 'dart:io';

import 'package:flutter/material.dart';
import 'package:krishiyan_admin/screen/Admin/AdminHomeScreen/PostNewsScreen.dart';
import 'package:krishiyan_admin/screen/Admin/AdminHomeScreen/UpdateorDeleteNews.dart';
import 'package:krishiyan_admin/screen/Admin/AdminProfile/Admin_profile.dart';
import 'package:krishiyan_admin/utils/AppColor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krishiyan_admin/screen/Admin/AdminFrm/Frmhome.dart';
import 'package:krishiyan_admin/screen/Admin/Enquiry/enquiry_page.dart';

class Adminhomepage extends StatefulWidget {
  @override
  _AdminhomepageState createState() => _AdminhomepageState();
}

class _AdminhomepageState extends State<Adminhomepage> {
  var _bottomNavIndex = 0;

  List<bottomCategory> iconList1 = [
    bottomCategory(name: "Home", id: "1", icon: 'assets/images/bottom1.png'),
    bottomCategory(name: "FRM", id: "2", icon: 'assets/images/bottom2.png'),
    bottomCategory(
        name: "Enq", id: "5", icon: 'assets/images/bottomCenter.png'),
    // bottomCategory(name: "Crop", id: "3", icon: 'assets/images/bottom3.png'),
    bottomCategory(name: "Profile", id: "4", icon: 'assets/images/bottom4.png'),
    // New item added
  ];

  File? _image;

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

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostNewsScreen()),
                );
              },
              child: Text('POST NEWS'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 76, 175, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Updateordeletenews()),
                );
              },
              child: Text('UPDATE/DELETE NEWS'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
      Frmhome(),
      EnquiryPage(), // Replace the placeholder with the actual EnquiryPage
      // CropLibraryScreen(),
      Admin_profile(),
    ];

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
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 26, 17, 17),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 2,
              spreadRadius: 0.8,
              color: AppColor.whiteColor,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: _bottomNavIndex,
            onTap: (index) {
              setState(() {
                _bottomNavIndex = index;
              });
            },
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            items: iconList1.map((category) {
              return BottomNavigationBarItem(
                icon: Image.asset(category.icon!, width: 25, height: 25),
                label: category.name,
              );
            }).toList(),
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}

class bottomCategory {
  String name;
  String? icon;
  String id;

  bottomCategory({
    required this.name,
    required this.id,
    this.icon,
  });
}
