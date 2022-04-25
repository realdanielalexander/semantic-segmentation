import 'dart:convert';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:file_picker/file_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:rxdart/rxdart.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  ImagePicker _picker = ImagePicker();
  // late String _imageOriginalPath;
  String _imageOriginal = '';
  String _imagePrediction = '';
  late double _imageWidth;
  late double _imageHeight;
  PlatformFile? objFile = null;
  bool _isBusy = false;

  late String _epochs;
  late String _learningRate;
  late String _architecture;

  selectImageAndPredict() async {
    var result = await FilePicker.platform.pickFiles();
    
    // var result2 = FilePickerResult(result!.files);
    // var result2 = await FilePicker.platform.pickFiles(withReadStream: true);
    // var result2 = List.from(result!.files);
    if (result != null) {
      setState(() {
        _isBusy = true;
      });
      Uint8List file = result.files.single.bytes!;
      var request = http.MultipartRequest('POST', Uri.parse('https://global-axe-348019.uc.r.appspot.com/original'));

      request.files.add(
          http.MultipartFile.fromBytes(
              'images',
              file,
              filename: 'upload.png',
              contentType: MediaType('*', '*')
          )
      );
      var streamedResponse = await request.send();
      var predictionResponse = await http.Response.fromStream(streamedResponse);

      if (_architecture == '64') {
        request = http.MultipartRequest('POST', Uri.parse('https://global-axe-348019.uc.r.appspot.com/image-64'));
      } else if (_architecture == '128') {
        request = http.MultipartRequest('POST', Uri.parse('https://global-axe-348019.uc.r.appspot.com/image-128'));
      } else {
        request = http.MultipartRequest('POST', Uri.parse('https://global-axe-348019.uc.r.appspot.com/image-256'));
      }

      request.files.add(
          http.MultipartFile.fromBytes(
              'images',
              file,
              filename: 'upload.png',
              contentType: MediaType('*', '*')
          )
      );
      streamedResponse = await request.send();
      var originalResponse = await http.Response.fromStream(streamedResponse);

      setState(() {
        _imagePrediction = predictionResponse.body;
        _imageOriginal = originalResponse.body;
        _isBusy = false;
      });
    }
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _architecture = args['architecture'];
    return ModalProgressHUD(
      inAsyncCall: _isBusy,
      child: Scaffold(
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
                  SingleChildScrollView(
                    child: Container(
                        width: 400,
                        // height: height,
                        padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 32.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    'Results',
                                    style: TextStyle(
                                        fontSize: 28.0,
                                        color: Colors.white
                                    )
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Classes Information'),
                                          // backgroundColor: Colors.transparent,
                                          // contentPadding: EdgeInsets.zero,
                                            content: Container(
                                              height: 300.0, // Change as per your requirement
                                              width: 300.0,
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(128, 0, 0, 1),
                                                      ),
                                                      title: Text('Building'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(64, 0, 128, 1),
                                                      ),
                                                      title: Text('Car'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(192, 0, 192, 1),
                                                      ),
                                                      title: Text('MotorcycleScooter'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(64, 64, 0, 1),
                                                      ),
                                                      title: Text('Pedestrian'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(128, 64, 128, 1),
                                                      ),
                                                      title: Text('Road'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(0, 0, 192, 1),
                                                      ),
                                                      title: Text('Sidewalk'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(192, 128, 128, 1),
                                                      ),
                                                      title: Text('SignSymbol'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(128, 128, 128, 1),
                                                      ),
                                                      title: Text('Sky'),
                                                    ),
                                                  ),
                                                  Card(
                                                    child: ListTile(
                                                      leading: Container(
                                                        height: 20,
                                                        width: 20,
                                                        color: Color.fromRGBO(128, 0, 0, 1),
                                                      ),
                                                      title: Text('Tree'),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                        );
                                      },
                                    );
                                  },
                                  child: Image.asset('assets/images/FIRSTPAGE/informationbutton.png', width: 40)
                                )
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text('Original Image', style: TextStyle(
                                    color: Colors.white
                                )),
                                SizedBox(height: 8),
                                _imagePrediction != '' ? Image.memory(base64Decode(_imagePrediction)) : Container(
                                  height: 180,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFF).withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                SizedBox(height: 8),

                                Text('Segmentation Map', style: TextStyle(
                                    color: Colors.white
                                )),
                                SizedBox(height: 8),
                                _imageOriginal != '' ?  Image.memory(base64Decode(_imageOriginal)):
                                Container(
                                  height: 180,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFF).withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ) ,
                                SizedBox(height: 8) ,


                                Text('Overlayed Image', style: TextStyle(
                                    color: Colors.white
                                )),
                                SizedBox(height: 8),
                                _imageOriginal != '' && _imagePrediction != '' ? Stack(
                                  children: [
                                    Image.memory(base64Decode(_imageOriginal)),
                                    Opacity(opacity: 0.3 ,child: Image.memory(base64Decode(_imagePrediction)))
                                  ],
                                ) : Container(
                                  height: 180,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFFF).withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                SizedBox(height: 16),
                                // _imagePrediction != '' && kIsWeb ? Image.network(_imageOriginal.path, width: double.infinity) : Image.file(_imageOriginal, width: double.infinity),


                                // Text('Overlayed', style: TextStyle(
                                //     color: Colors.white
                                // )),
                                GestureDetector(
                                  onTap: () async {
                                    selectImageAndPredict();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 80,
                                    padding: EdgeInsets.symmetric(horizontal: 40),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF404CD0),
                                      borderRadius: BorderRadius.circular(28.0),
                                    ),
                                    child: Text('Select Image', style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white
                                    )),
                                  )
                                ),
                              ]
                            )
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
