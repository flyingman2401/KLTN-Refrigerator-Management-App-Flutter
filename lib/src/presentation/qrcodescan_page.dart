import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';

class QRCodeScanPage extends StatefulWidget {
  const QRCodeScanPage({super.key});

  @override
  QRCodeScanPageState createState() => QRCodeScanPageState();
}

class QRCodeScanPageState extends State<QRCodeScanPage> {

  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  String result = "";

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
      String stringData = scanData.code!;
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('QR scanned!'),
          content: Text('Result: $stringData'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      setState(() {
        result = scanData.code!;
      });
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
              child: QRView(
                key: qrKey, 
                onQRViewCreated: _onQRViewCreated,
                overlay: QrScannerOverlayShape(
                  borderColor: Colors.white,
                  borderWidth: 8.0,
                  borderRadius: 30.0,
                  borderLength: 50.0
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BackButton(
                        onPressed: () => {Navigator.pop(context, true)},
                      ),
                      Text('Quét mã QR', style: Theme.of(context).textTheme.titleLarge, )
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      // color: Colors.blue,
                    ),
                    child: IconButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.black),

                      ),
                      icon: SvgPicture.asset(
                        'lib/images/flash-off.svg',
                        width: 24.0,
                        height: 24.0,
                        color: Colors.white,
                      ),
                      onPressed: () => {},
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
