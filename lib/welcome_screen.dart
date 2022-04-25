import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
            child: Container(
              width: 400,
              color: const Color(0xFF2A251E),
              child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/FIRSTPAGE/BG-01.png"),
                            fit: BoxFit.cover
                        ),
                      ),),
                    Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/FIRSTPAGE/CIRCLE-OVERLAY-01.png"),
                              fit: BoxFit.cover
                          ),
                        )
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/FIRSTPAGE/BLACK-BG-01.png"),
                              fit: BoxFit.cover
                          ),
                        )
                    ),
                    Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/FIRSTPAGE/CAR-01.png"),
                              fit: BoxFit.cover
                          ),
                        )
                    ),
                    Positioned(
                      bottom: 300,
                      child: Container(
                        width: 300,
                        child: Text('Semantic Image Segmentation',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                            )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 240,
                      child: Container(
                        width: 300,
                        child: Text('Predict pixel level labels for urban scene understanding.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Text('Code by Daniel A \n Design by Yemima S A', textAlign: TextAlign.center, style: TextStyle(fontSize: 8, color: Colors.white),),
                    ),
                    Positioned(
                      bottom: 120,
                      child: TextButton(onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/method-selection');
                      },
                          child: Text("Start", style: TextStyle(fontSize: 24)),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal: 64, vertical: 16)),
                              foregroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFFFFFF)),
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF2C3546)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      side: BorderSide(color: const Color(0xFF2C3546))
                                  )
                              )
                          )),
                    ),
                  ]
              ),
            ),
          )
      ),
    );
  }
}
