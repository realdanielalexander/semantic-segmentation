import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ImagePicker _picker = ImagePicker();
  // late String _imageOriginalPath;
  late File _imageOriginal = File('assets/images/LASTPAGE/placeholder.jpg');
  String _imagePrediction = '';
  late double _imageWidth;
  late double _imageHeight;

  selectFromImagePicker(bool fromCamera) async {
    PickedFile? pickedFile = fromCamera
        ? await _picker.getImage(source: ImageSource.camera)
        : await _picker.getImage(source: ImageSource.gallery);
    print(pickedFile.readAsBytes());
    File image = File(pickedFile!.path);

    if (image == null) return;
    setState(() {
      // _imageOriginal = image;
      // _busy = true;
    });
    predictImage(image);
  }

  predictImage(File image) async {
    if (image == null) return;

    // _setLoading(true);

    await detect(image);

    FileImage(image)
        .resolve(ImageConfiguration())
        .addListener((ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageWidth = info.image.width.toDouble();
        _imageHeight = info.image.height.toDouble();
      });
    })));
    // _setLoading(false);
  }



  detect(File image) async {
    Dio dio = new Dio();

    // FormData formDataDetections = FormData.fromMap({
    //   "images": await MultipartFile.fromFile(image.path, filename: "upload.jpg")
    // });

    // Android
    // FormData formDataImage = FormData.fromMap({
    //   "images": await MultipartFile.fromFile(image.path, filename: "upload.jpg")
    // });
    var postUri = Uri.parse("http://global-axe-348019.uc.r.appspot.com/image");
    var request = http.MultipartRequest("POST", postUri);
    print('ok');
    // print(await image.bytes);
    request.files.add(await http.MultipartFile.fromBytes('image', await image.readAsBytes(), filename: "upload.jpg"));

    // request.files.add(await http.MultipartFile.fromPath('image', image.name));
    // request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(Uri.parse(image.name)).readAsBytes(), contentType: new MediaType('image', 'png')));

    print('sending data');
    request.send().then((response) {
      if (response.statusCode == 200) print(response);
    });


    // var multiPFile = await MultipartFile.fromBytes(file.bytes,
    //     filename: file.name, contentType: MediaType.parse(mimeType));

    // print(formDataImage);
    // print('sending data');
    // var imageResponse =
    // await dio.post('http://global-axe-348019.uc.r.appspot.com/image', data: formDataImage);
    //
    // print(imageResponse);

    // var recognitions = detectionResponse.data['response'][0]['detections'];
    setState(() {
      // _recognitions = recognitions;
      // _imagePrediction = imageResponse.toString();
    });
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: const Color(0xFFFAF4ED),
        body: Center(
          child: Container(
            width: 400,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/LASTPAGE/BG-03.png"),
                        fit: BoxFit.cover
                    ),
                  ),),
                Container(
                    width: 400,
                    // height: height,
                    padding: EdgeInsets.fromLTRB(32.0, 128.0, 32.0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                            width: 400,
                            child: Text(
                                'Results',
                                style: TextStyle(
                                    fontSize: 28.0,
                                    color: Colors.white
                                )
                            )
                        ),
                        SizedBox(height: 64.0),
                        GridView.count(
                          primary: false,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 1,
                          childAspectRatio: 4.0,
                          shrinkWrap: true,
                          children: <Widget>[
                            Text('Segmentation Map', style: TextStyle(
                                color: Colors.white
                            )),
                            kIsWeb ? Image.network(_imageOriginal.path) : Image.file(_imageOriginal)
                            ,
                            Text('Raw Image', style: TextStyle(
                                color: Colors.white
                            )),
                            // if (_imagePrediction != '') Image.memory(base64Decode(_imagePrediction)),
                            // Text('Overlayed', style: TextStyle(
                            //     color: Colors.white
                            // )),
                            GestureDetector(
                              onTap: () async {
                                selectFromImagePicker(false);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF404CD0),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Text('Camera', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ))
                              ),
                            ),
                          ],),
                      ],
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}
