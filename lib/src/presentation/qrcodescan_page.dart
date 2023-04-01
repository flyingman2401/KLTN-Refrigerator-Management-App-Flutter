import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'dart:convert';

import 'package:refrigerator_management_app/src/data/data_structure.dart';

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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    
    controller.scannedDataStream.listen((scanData) {
      if (!scanDone) {
        // Scanned result
        scanDone = true;
        String stringData = scanData.code!;
        FoodQRCode data = FoodQRCode.fromJson(jsonDecode(stringData));
        
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('QR scanned!'),
            content: Text(
              'Result: \n'
              'Sản phẩm: ${data.foodName} \n'
              'Nhà sản xuất: ${data.manufactureName} \n'
              'Ngày sản xuất: ${data.productionDate} \n'
              'Hạn sử dụng: ${data.expirationDate} \n'
              'Số lượng: ${data.amount} \n'
              'Đơn vị tính: ${data.unit} \n'
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  scanDone = false;
                  Navigator.pop(context, 'Cancel');
                } ,
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
        setState(() {
          result = scanData.code!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.blue
              ),
            ),
            Center(child: Container(
              width: MediaQuery.of(context).size.width - 100,
              height: MediaQuery.of(context).size.height - 200,
              decoration: BoxDecoration(
                color: Colors.black
              ),
              foregroundDecoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0)
              ),
              child: QRView(
                key: qrKey, 
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  // overlayColor: Colors.black,
                  borderColor: Colors.white,
                  borderWidth: 8.0,
                  borderRadius: 30.0,
                  borderLength: 50.0
                ),
              ),
            ),),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BackButton(
                          color: Colors.white,
                          onPressed: () => {Navigator.pop(context, true)},
                        ),
                        Text(
                          'Quét mã QR', 
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'
                          ), 
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      // color: Colors.yellow,
                    ),
                    child: IconButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),

                      ),
                      icon: flashIconPressed
                        ? SvgPicture.asset(
                          'lib/images/flash.svg',
                          width: 24.0,
                          height: 24.0,
                          // ignore: deprecated_member_use
                          color: Colors.white,
                        )
                        : SvgPicture.asset(
                          'lib/images/flash-off.svg',
                          width: 24.0,
                          height: 24.0,
                          color: Colors.white,
                        ),
                      onPressed: () {
                        setState(() {
                          flashIconPressed = !flashIconPressed;
                          controller!.toggleFlash();
                        });
                      }
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}
