import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:photo_app/model/gallery_model.dart';

Future<List<PhotoGalleryModel>> getPhotos() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);

    return data.map((json) => PhotoGalleryModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load photos');
  }
}
