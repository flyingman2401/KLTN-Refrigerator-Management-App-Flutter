
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScanPage extends StatefulWidget {
  const QRCodeScanPage({super.key});
  
  @override
  QRCodeScanPageState createState() => QRCodeScanPageState();
}

class QRCodeScanPageState extends State<QRCodeScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 12.0, right: 12.0),
            child: Row( 
              children: [
                BackButton(
                  onPressed: () => Navigator.pop(context, true),
                ),
              ]
            )
          ),
          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: QRView(
          //     key: qrKey,
          //     onQRViewCreated: onQRViewCreated,
          //     overlay: QrScannerOverlayShape(),
          //   ),
          // )
          Container(
            width:  MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 64,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
            )
          )
        ],
      )
    );
  }


  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
  }
}
