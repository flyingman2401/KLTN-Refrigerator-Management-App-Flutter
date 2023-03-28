import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 24.0),
            Container(
              width: 48.0,
              height: 48.0,
              decoration: const BoxDecoration(
                color: Colors.green
              ),
              // padding: EdgeInsets.only(bottom: 12.0, left: 12.0),
              child: BackButton(
                onPressed: () => Navigator.pop(context),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 24.0 - 48.0,
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
                    )
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text("Scan result: $result"),
                    ),
                  )
                ],
              )
            )
            

          ],
        )
      ),
    );
  }
}
