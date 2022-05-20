import 'package:flutter/material.dart';

class MethodSelection extends StatefulWidget {
  const MethodSelection({Key? key}) : super(key: key);

  @override
  State<MethodSelection> createState() => _MethodSelectionState();
}

class _MethodSelectionState extends State<MethodSelection> {
  var _selectedArchitecture = '';
  late var _image;
  List<String> architectures = [
    '64',
    '128',
    '256'
  ];
  // var _selectedEpochs = '100';
  // List<String> epochs = [
  //   '100',
  //   '200',
  //   '300'
  // ];
  // var _selectedLR = '0.001';
  // List<String> learningRates = [
  //   '0.001',
  //   '0.0001',
  //   '0.00001'
  // ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appBar = AppBar(
      title: Text('Home'),
    );
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _image = args['image'];

    return SafeArea(
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
                          image: AssetImage("assets/images/NEXTPAGE/BG-02.png"),
                          fit: BoxFit.cover
                      ),
                    ),),
                  Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/NEXTPAGE/CIRCLE-OVERLAY-02.png"),
                            fit: BoxFit.cover
                        ),
                      )
                  ),
                  Container(
                    width: 400,
                    // height: height,
                    padding: EdgeInsets.fromLTRB(32.0, 128.0, 32.0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                            width: 400,
                            child: Text(
                                'Select\nModel Configuration',
                                style: TextStyle(
                                    fontSize: 28.0,
                                    color: Colors.white
                                )
                            )
                        ),
                        SizedBox(height: 32,),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _selectedArchitecture = '64';
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              decoration: BoxDecoration(
                                color: Color(0xFF2C3546),
                                // color: _selectedArchitecture == '64' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                border: _selectedArchitecture == '64' ? Border.all(color: Colors.white,): null,
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('64 Filters', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  )),
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              // backgroundColor: Colors.transparent,
                                              // contentPadding: EdgeInsets.zero,
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset('assets/images/NEXTPAGE/ARSI-64.png'),
                                                  Text('Architecture: DeepLabV3+ with 64 Convolutional Filters',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.bold
                                                      )),
                                                  Text('Max Accuracy: 75.423% average validation mIoU with 300 epochs and 0.0001 learning rate', textAlign: TextAlign.center)
                                                ],
                                              )
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset('assets/images/FIRSTPAGE/informationbutton.png', width: 40)
                                  )
                                ],
                              )
                          ),
                        ),
                        SizedBox(height: 8,),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _selectedArchitecture = '128';
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              decoration: BoxDecoration(
                                color: Color(0xFF2C3546),
                                // color: _selectedArchitecture == '64' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                border: _selectedArchitecture == '128' ? Border.all(color: Colors.white,): null,
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('128 Filters', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  )),
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              // backgroundColor: Colors.transparent,
                                              // contentPadding: EdgeInsets.zero,
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset('assets/images/NEXTPAGE/ARSI-128.png'),
                                                    Text('Architecture: DeepLabV3+ with 128 Convolutional Filters',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold
                                                        )),
                                                    Text('Max Accuracy: 75.274% mean validation mIoU with 300 epochs and 0.0001 Learning Rate', textAlign: TextAlign.center)
                                                  ],
                                                )
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset('assets/images/FIRSTPAGE/informationbutton.png', width: 40)
                                  )
                                ],
                              )
                          ),
                        ),
                        SizedBox(height: 8,),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _selectedArchitecture = '256';
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              decoration: BoxDecoration(
                                color: Color(0xFF2C3546),
                                // color: _selectedArchitecture == '64' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                border: _selectedArchitecture == '256' ? Border.all(color: Colors.white,): null,
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('256 Filters', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  )),
                                  GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              // backgroundColor: Colors.transparent,
                                              // contentPadding: EdgeInsets.zero,
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset('assets/images/NEXTPAGE/ARSI-256.png'),
                                                    Text('Architecture: DeepLabV3+ with 256 Convolutional Filters',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: FontWeight.bold
                                                        )),
                                                    Text('Max Accuracy: 76.478% average validation mIoU with 300 epochs and 0.0001 Learning Rate', textAlign: TextAlign.center)
                                                  ],
                                                )
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset('assets/images/FIRSTPAGE/informationbutton.png', width: 40)
                                  )
                                ],
                              )
                          ),
                        ),
                        SizedBox(height: 8,),
                        // Text('Epochs: ', style: TextStyle(color: Colors.white),),
                        // DropdownButton(
                        //   value: _selectedEpochs,
                        //   isExpanded: true,
                        //   itemHeight: 80,
                        //   icon: const Icon(Icons.keyboard_arrow_down),
                        //   items: epochs.map((String items) {
                        //     return DropdownMenuItem(
                        //       value: items,
                        //       alignment: Alignment.center,
                        //       child: Text(items),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       _selectedEpochs = newValue!;
                        //     });
                        //   },
                        // ),Text('Learning Rate: ', style: TextStyle(color: Colors.white),),
                        // DropdownButton(
                        //   value: _selectedLR,
                        //   isExpanded: true,
                        //   itemHeight: 80,
                        //   icon: const Icon(Icons.keyboard_arrow_down),
                        //   items: learningRates.map((String items) {
                        //     return DropdownMenuItem(
                        //       value: items,
                        //       alignment: Alignment.center,
                        //       child: Text(items),
                        //     );
                        //   }).toList(),
                        //   onChanged: (String? newValue) {
                        //     setState(() {
                        //       _selectedLR = newValue!;
                        //     });
                        //   },
                        // ),
                        GestureDetector(
                          onTap: () async {
                            if (_selectedArchitecture == '') return;
                            // if (_selectedEpochs == '') return;
                            // if (_selectedLR == '') return;
                            Navigator.pushNamed(context, '/result-page', arguments: {
                              'architecture': _selectedArchitecture,
                              'image': _image
                            }
                            );
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              decoration: BoxDecoration(
                                color: _selectedArchitecture != '' ? Color(0xFF404CD0) : Colors.grey,
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: Text('Predict', style: TextStyle(
                                  fontSize: 20.0,
                                  color: _selectedArchitecture != '' ? Colors.white : Colors.black38,
                              )),
                          ),
                        ),
                      ],)
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
