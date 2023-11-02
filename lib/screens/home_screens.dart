import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_app/model/gallery_model.dart';
import 'package:photo_app/screens/photo_details_screen.dart';
import 'package:photo_app/services/gallery_services.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  Future<List<PhotoGalleryModel>>? photoFetch;

  @override
  void initState() {
    super.initState();
    photoFetch = getPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo App Gallery'),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<PhotoGalleryModel>>(
        future: photoFetch,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No photos available');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final photo = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => PhotoDetailsScreen(
                          title: photo.title,
                          id: photo.id.toString(),
                          imageUrl: photo.url.toString(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(photo.url! ?? " "),
                      title: Text(photo.title!),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
