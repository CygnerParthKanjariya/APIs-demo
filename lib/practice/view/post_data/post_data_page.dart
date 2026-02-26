
import 'package:flutter/material.dart';

import '../../services/api_post_service.dart';
import '../put_data/put_data_page.dart';

class PostDataPage extends StatelessWidget {
  const PostDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Data Here"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PutDataPage()),
              );
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool success = await ApiPostService.createPost();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  success
                      ? "New Data Created Successfully"
                      : "Failed to Create Data",
                ),
                duration: Duration(seconds: 1),
              ),
            );
          },
          child: Text("Add New Data"),
        ),
      ),
    );
  }
}
