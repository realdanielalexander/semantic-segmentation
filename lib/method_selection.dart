import 'package:flutter/material.dart';

class MethodSelection extends StatefulWidget {
  const MethodSelection({Key? key}) : super(key: key);

  @override
  State<MethodSelection> createState() => _MethodSelectionState();
}

class _MethodSelectionState extends State<MethodSelection> {
  var _selectedArchitecture = '1';
  var _selectedEpochs = '100';
  var _selectedLR = '1';
  var _selectedFilters = '512';

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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/NEXTPAGE/BLACK-BG-02.png"),
                            fit: BoxFit.fitHeight
                        ),
                      )
                  ),
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
                        GridView.count(
                          primary: false,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 1,
                          childAspectRatio: 4.0,
                          shrinkWrap: true,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _selectedArchitecture = '1';
                                });
                                Navigator.pushNamed(context, '/texture-selection', arguments: {'race': 'swamp'});
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '1' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Text('Architecture 1', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ))
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _selectedArchitecture = '2';
                                });
                                Navigator.pushNamed(context, '/texture-selection', arguments: {'race': 'swamp'});
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '2' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Text('Architecture 2', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ))
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                setState(() {
                                  _selectedArchitecture = '3';
                                });
                                Navigator.pushNamed(context, '/texture-selection', arguments: {'race': 'swamp'});
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: _selectedArchitecture == '3' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: Text('Architecture 3', style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white
                                  ))
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.pushNamed(context, '/result-page');
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: _selectedArchitecture == '3' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                        borderRadius: BorderRadius.circular(28.0),
                                      ),
                                      child: Text('Camera', style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white
                                      ))
                                  ),
                                ),),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    Navigator.pushNamed(context, '/result-page');
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: _selectedArchitecture == '3' ? Color(0xFF404CD0) : Color(0xFF2C3546),
                                        borderRadius: BorderRadius.circular(28.0),
                                      ),
                                      child: Text('Gallery', style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white
                                      ))
                                  ),
                                ),)
                            ],)
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
