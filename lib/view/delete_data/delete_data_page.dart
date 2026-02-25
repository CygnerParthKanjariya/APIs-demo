import 'package:api_demo/services/api_delete_service.dart';
import 'package:flutter/material.dart';

class DeleteDataPage extends StatelessWidget {
  const DeleteDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete Data From Here"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ApiDeleteService.deleteDate();
          },
          child: Text("Delete Data"),
        ),
      ),
    );
  }
}
