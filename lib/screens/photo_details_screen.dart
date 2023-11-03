import 'package:flutter/material.dart';
import 'package:photo_app/model/gallery_model.dart';
import 'package:photo_app/services/gallery_services.dart';

class PhotoDetailsScreen extends StatefulWidget {
  const PhotoDetailsScreen(
      {Key? key, required this.title, required this.id, required this.imageUrl})
      : super(key: key);
  final dynamic title;
  final dynamic id;
  final String imageUrl;

  @override
  State<PhotoDetailsScreen> createState() => _PhotoDetailsScreen();
}

class _PhotoDetailsScreen extends State<PhotoDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details of Photo'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                widget.imageUrl,
              ),
              SizedBox(height: 10),
              Text(
                'Title of Image: ${widget.title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Text('ID:${widget.id}',
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 20)),
            ],
          ),
        ));
  }
}
