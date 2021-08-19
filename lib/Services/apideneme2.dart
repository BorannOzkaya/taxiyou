import 'dart:convert';
import 'package:com.example.Taxi4You/screens/post/post.dart';
import 'package:http/http.dart';

class HttpService {
  final String postsURL =
      "https://taxiforyou.ch/wp-json/theme/v1/get_service_list";

  // https://jsonplaceholder.typicode.com/posts
  // get function

  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  // delete function

  Future<void> deletePost(int? id) async {
    Response res =
        await delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }

  // update function

  Future<Response> updatePost(String title, int? id) async {
    try {
      return put(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'title': title,
          'id': id,
        }),
      );
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Response> patchPost(String title, int? id) async {
    try {
      return patch(
        Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'title': title,
          'id': id,
        }),
      );
    } catch (e) {
      print(e);
      throw e;
    }
  }
}
