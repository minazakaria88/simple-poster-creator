import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';

class PosterScreen extends StatelessWidget {
  String? image;
  PosterScreen(this.image);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'poster design',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(image!),
          ),
          Center(
            child: MaterialButton(
              color: Colors.blue,
              child: const Text(
                'download',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onPressed: () async {
                try {
                  var imageId = await ImageDownloader.downloadImage(image!);
                  if (imageId == null) {
                    return;
                  }
                  var fileName = await ImageDownloader.findName(imageId);
                  var path = await ImageDownloader.findPath(imageId);
                  var size = await ImageDownloader.findByteSize(imageId);
                  print('sdfdsffffffffffffffffffffffffffff$size');
                  var mimeType = await ImageDownloader.findMimeType(imageId);
                } on PlatformException catch (error) {
                  print(error);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
