import 'package:api_demo/models/post_model.dart';
import 'package:api_demo/services/api_service.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Demo"), centerTitle: true),
      body: FutureBuilder<List<PostModel>>(
        future: ApiService().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print(snapshot.error);
            print("no data");
            return Center(child: Text("No Data"));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          id: posts[index].id,
                          title: posts[index].title,
                          body: posts[index].body,
                        ),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    child: Text(posts[index].id.toString()),
                  ),
                  title: Text(posts[index].title, maxLines: 1),
                  subtitle: Text(posts[index].body, maxLines: 1),
                );
              },
            );
          }
        },
      ),
    );
  }
}
