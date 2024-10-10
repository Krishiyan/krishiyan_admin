import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krishiyan_admin/utils/AppColor.dart';

class Updateordeletenews extends StatefulWidget {
  const Updateordeletenews({super.key});

  @override
  State<Updateordeletenews> createState() => _UpdateordeletenewsState();
}

class _UpdateordeletenewsState extends State<Updateordeletenews> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _newsItems = [];
  File? _image;
  bool _isLoading = false;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/bottom1.png', width: 25, height: 25),
        label: 'Home'),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/bottom2.png', width: 25, height: 25),
        label: 'Farm'),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/bottom3.png', width: 25, height: 25),
        label: 'Crop'),
    BottomNavigationBarItem(
        icon: Image.asset('assets/images/bottom4.png', width: 25, height: 25),
        label: 'Profile'),
  ];

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

  void _editNews(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => EditNewsScreen(
                title: 'Lorem Ipsum Heading ${index + 1}',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                image: null, // Replace with actual image
                priority: 1, // Replace with actual priority
              )),
    );
  }

  void _searchNews() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate searching (replace with actual API call)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      // Clear form fields after searching
      _searchController.clear();
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
            currentIndex: 0,
            onTap: (index) {},
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,
            items: bottomItems,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'UPDATE/DELETE NEWS',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search By Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _isLoading ? null : _searchNews,
              child: Text(_isLoading ? 'Searching...' : 'Search'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(16),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Lorem Ipsum Heading ${index + 1}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://picsum.photos/200/300'), // Placeholder image URL
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () => _editNews(index),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.blue),
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white)),
                                child: Text('EDIT'),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.red),
                                ),
                                child: Text('DELETE'),
                              ),
                            ],
                          ),
                        ),
                      ],
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

class EditNewsScreen extends StatefulWidget {
  final String title;
  final String description;
  final File? image;
  final int priority;

  const EditNewsScreen({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
    required this.priority,
  }) : super(key: key);

  @override
  _EditNewsScreenState createState() => _EditNewsScreenState();
}

class _EditNewsScreenState extends State<EditNewsScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  File? _image;
  bool _isLoading = false;

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

  void _updateNews() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate updating news (replace with actual API call)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
      // Clear form fields after updating
      _titleController.clear();
      _descriptionController.clear();
      _priorityController.clear();
      _image = null;
    });
  }

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.title;
    _descriptionController.text = widget.description;
    _priorityController.text = widget.priority.toString();
    _image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EDIT NEWS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                onPressed: _isLoading ? null : _updateNews,
                child: Text(_isLoading ? 'Updating...' : 'UPDATE NEWS'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
