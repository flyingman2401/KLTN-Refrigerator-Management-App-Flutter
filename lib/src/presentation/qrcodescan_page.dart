import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'dart:convert';

import 'package:refrigerator_management_app/src/data/data_structure.dart';
import 'package:refrigerator_management_app/src/widgets/qrcodescan_widget.dart';

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
        
        scanDone = true;
        FoodQRCodeData jsonFoodData = FoodQRCodeData.fromJson(jsonDecode(scanData.code!));
        
        // Chuyển trang hiển thị thông tin, lưu trạng thái
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('QR scanned!'),
            content: Text(
              'Result: \n'
              'Sản phẩm: ${jsonFoodData.foodName} \n'
              'Nhà sản xuất: ${jsonFoodData.manufactureName} \n'
              'Ngày sản xuất: ${jsonFoodData.productionDate} \n'
              'Hạn sử dụng: ${jsonFoodData.expirationDate} \n'
              'Số lượng: ${jsonFoodData.amount} \n'
              'Đơn vị tính: ${jsonFoodData.unit} \n'
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
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 24.0)),

            // Header
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

            // QR View
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,
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

            // Buttons
            Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const FoodManagementSelection(),
                    // FlashIconButton(controller: controller)
                  ],
                ),
              ),
            )

          ],
        )
      )
    );
  }
}
