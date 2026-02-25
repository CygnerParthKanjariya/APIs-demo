import 'package:api_demo/view/delete_data/delete_data_page.dart';
import 'package:flutter/material.dart';

import '../../services/api_put_service.dart';

class PutDataPage extends StatelessWidget {
  const PutDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Data Here"),
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
                MaterialPageRoute(builder: (context) => DeleteDataPage()),
              );
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ApiPutService.putData();
          },
          child: Text("Update Data"),
        ),
      ),
    );
  }
}
