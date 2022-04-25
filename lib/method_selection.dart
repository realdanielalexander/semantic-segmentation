import 'package:flutter/material.dart';

class MethodSelection extends StatefulWidget {
  const MethodSelection({Key? key}) : super(key: key);

  @override
  State<MethodSelection> createState() => _MethodSelectionState();
}

class _MethodSelectionState extends State<MethodSelection> {
  var _selectedArchitecture = '64';
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

    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFFAF4ED),
          body: Center(
            child: Container(
              width: 400,
              child: Stack(
                children: [
                  // Container(
                  //   width: double.infinity,
                  //   height: double.infinity,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("assets/images/NEXTPAGE/BG-02.png"),
                  //         fit: BoxFit.cover
                  //     ),
                  //   ),),
                  // Container(
                  //     decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/images/NEXTPAGE/CIRCLE-OVERLAY-02.png"),
                  //           fit: BoxFit.cover
                  //       ),
                  //     )
                  // ),
                  // Container(
                  //     decoration: const BoxDecoration(
                  //       image: DecorationImage(
                  //           image: AssetImage("assets/images/NEXTPAGE/BLACK-BG-02.png"),
                  //           fit: BoxFit.fitHeight
                  //       ),
                  //     )
                  // ),
                  Container(
                    width: 400,
                    // height: height,
                    padding: EdgeInsets.fromLTRB(32.0, 128.0, 32.0, 0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 400,
                          child: Text(
                            'Select\nConfiguration',
                            style: TextStyle(
                              fontSize: 28.0,
                              color: Colors.white
                            )
                          )
                        ),
                        SizedBox(height: 64.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _selectedArchitecture = '1';
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '1' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Architecture 1', style: TextStyle(
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
                                                    children: [
                                                      Image.asset('assets/images/NEXTPAGE/ARSI-64.png'),
                                                      Text('Architecture with 64 Convolutional Filters'),
                                                      Text('Max Accuracy: 85% with 100 epochs and 0.0001 Learning Rate')
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
                                  _selectedArchitecture = '2';
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '2' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Architecture 2', style: TextStyle(
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
                                                      children: [
                                                        Image.asset('assets/images/NEXTPAGE/ARSI-64.png'),
                                                        Text('Architecture with 64 Convolutional Filters'),
                                                        Text('Max Accuracy: 85% with 100 epochs and 0.0001 Learning Rate')
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
                                  _selectedArchitecture = '3';
                                });
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '3' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Architecture 3', style: TextStyle(
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
                                                      children: [
                                                        Image.asset('assets/images/NEXTPAGE/ARSI-64.png'),
                                                        Text('Architecture with 64 Convolutional Filters'),
                                                        Text('Max Accuracy: 85% with 100 epochs and 0.0001 Learning Rate')
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
                                  // 'epochs': _selectedEpochs,
                                  // 'learningRate': _selectedLR,
                                }
                                );
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 80,
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '3' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Text('Predict', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  )),
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
      ),
    );
  }
}
