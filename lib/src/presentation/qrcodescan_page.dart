// Import reference libraries

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// Import implemented widgets for QR code scanner page

import 'package:refrigerator_management_app/src/widgets/qrcodescan_widget.dart';


// Stateful QR Code Scanner Page

class QRCodeScanPage extends StatefulWidget {
  const QRCodeScanPage({super.key});

  @override
  QRCodeScanPageState createState() => QRCodeScanPageState();
}

class QRCodeScanPageState extends State<QRCodeScanPage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = "";
  bool flashIconPressed = false;
  bool scanDone = false;
  int action = 0; // action 0 for add food, action 1 for take food out

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble () {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    
    // Listen for result of scanning
    controller.scannedDataStream.listen((scanData) {
      if (!scanDone) {
        scanDone = true;
        showModalBottomSheet(
          context: context, 
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) => ResultDialog(
            message: scanData.code!,
            action: action,
            callback: (value) => scanDone = value,
          ),
        );
      }
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),

            // Header row with back button, title and help button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                BackButtonQRScanPage(),
                Text(
                            'Quét mã QR', 
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'
                            ), 
                          ),
                HelpButton(),
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),

            // QR Scan View
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: onQRViewCreated,
                      overlay: QrScannerOverlayShape(
                        // overlayColor: Color.fromRGBO(0, 0, 0, 0.2),
                        borderColor: Colors.white,
                        borderWidth: 8.0,
                        borderRadius: 30.0,
                        borderLength: 50.0
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: FlashIconButton(controller: controller),
                    )
                  )
                ],
              ),
            ),

            // Action selection Slider
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FoodManagementSelection(callback: (value) => action = value,),
                ],
              ),
            )

          ],
        )
      )
    );
  }
}
