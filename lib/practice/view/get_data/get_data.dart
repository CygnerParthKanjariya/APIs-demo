
import 'package:flutter/material.dart';

import '../../models/post_model.dart';
import '../../services/api_get_service.dart';
import '../post_data/post_data_page.dart';
import 'detail_page.dart';

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Demo"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostDataPage()),
              );
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: FutureBuilder<List<PostModel>>(
        future: ApiGetService().fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
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
