// Import reference libraries

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// Import implemented data structures

import '../data/data_structure.dart';

// Import implemented features

import '../features/food_manage_features.dart';


// Back button for header of QR code scan page

class BackButtonQRScanPage extends StatelessWidget {
  const BackButtonQRScanPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'lib/images/back.svg',
        // ignore: deprecated_member_use
        color: Colors.black,
        width: 24,
        height: 24,
      ), 
      onPressed: () {
        Navigator.maybePop(context);
      },
    );
  }
  
}

// Help button for header of QR code scan page

class HelpButton extends StatelessWidget {
  const HelpButton({super.key});
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        'lib/images/help.svg',
        // ignore: deprecated_member_use
        color: Colors.black,
        width: 24,
        height: 24,
      ), 
      onPressed: () {  },
    );
  }
  
}

// Flash icon button in footer selection

class FlashIconButton extends StatefulWidget {
  const FlashIconButton({
    super.key,
    required this.controller
  });

  final QRViewController? controller;

  @override
  FlashIconButtonState createState() => FlashIconButtonState();
  
}

class FlashIconButtonState extends State<FlashIconButton> {

  bool flashIconPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const CircleBorder()),
        minimumSize: MaterialStateProperty.all(const Size.square(72.0)),
        iconSize: MaterialStateProperty.all(24.0),
        backgroundColor: flashIconPressed
          ? MaterialStateProperty.all(Colors.white)
          : MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
        shadowColor: flashIconPressed
          ? MaterialStateProperty.all(Colors.white)
          : MaterialStateProperty.all(Colors.transparent)
      ),
      onPressed: () {
        setState(() {
          flashIconPressed = !flashIconPressed;
          (widget.controller)!.toggleFlash();
        });
      },
      child: flashIconPressed
        ? SvgPicture.asset(
          'lib/images/flash.svg',
          width: 24.0,
          height: 24.0,
          // ignore: deprecated_member_use
          color: Colors.black,
        )
        : SvgPicture.asset(
          'lib/images/flash-off.svg',
          width: 24.0,
          height: 24.0,
          // ignore: deprecated_member_use
          color: Colors.white,
        ),
    );
  }

}

// Cupatino Sliding Segment controll

class FoodManagementSelection extends StatefulWidget {
  const FoodManagementSelection({
    super.key,
    required this.callback
  });

  final Function callback;

  @override
  FoodManagementSelectionState createState() => FoodManagementSelectionState();

}

class FoodManagementSelectionState extends State<FoodManagementSelection> {
  
  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = const <int, Widget>{
    0: Text("Thêm thực phẩm", style: TextStyle(fontSize: 14)),
    1: Text("Lấy thực phẩm", style: TextStyle(fontSize: 14))
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoSlidingSegmentedControl(
      groupValue: segmentedControlGroupValue,
      children: myTabs,
        onValueChanged: (i) {
          widget.callback(i);
          setState(() {
            segmentedControlGroupValue = i!;
          });
        }
    );
  }

}

// Dialog of result

class ResultDialog extends StatefulWidget {
  const ResultDialog({
    super.key,
    required this.message,
    required this.action,
    required this.callback
  });

  final String message;
  final int action;
  final Function callback;

  @override
  ResultDialogState createState() => ResultDialogState();
  
}

class ResultDialogState extends State<ResultDialog> {

  @override
  Widget build(BuildContext context) {

    FoodQRCodeData jsonFoodData = FoodQRCodeData.fromJson(jsonDecode(widget.message));

    return DraggableScrollableSheet(
      initialChildSize: 0.4,
      minChildSize: 0.2,
      maxChildSize: 0.98,
      expand: true,
      builder: (_, controller) => Container(

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          )
        ),
        
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              // Header title
              const Center(
                child: Text(
                  'Thông tin thực phẩm',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ),

              // Padding between header and body content
              const Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),

              // Content splited from scanned json result
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    
                    // Sản phẩm
                    const TextSpan(
                      text: 'Sản phẩm: ',
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: '${jsonFoodData.foodName} \n',
                      style: const TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal
                      )
                    ),

                    // Nhà sản xuất
                    const TextSpan(
                      text: 'Nhà sản xuất: ',
                      style: TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                      )
                    ),
                    TextSpan(
                      text: '${jsonFoodData.manufactureName} \n',
                      style: const TextStyle(
                        height: 1.2,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal
                      )
                    ),
                    
                    // Ngày sản xuất
                    const TextSpan(
                              text: 'Ngày sản xuất: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${jsonFoodData.productionDate} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                    
                    // Hạn sử dụng
                    const TextSpan(
                              text: 'Hạn sử dụng: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${jsonFoodData.expirationDate} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                            
                    // Số lượng / Khối lượng
                    const TextSpan(
                              text: 'Số lượng: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${jsonFoodData.amount} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                    
                    // Đơn vị tính
                    const TextSpan(
                              text: 'Đơn vị tính: ',
                              style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold
                              )
                            ),
                    TextSpan(
                              text: '${jsonFoodData.unit} \n',
                              style: const TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal
                              )
                            ),
                  
                  ]
                ),
              ),

              // Action button at end of pop up dialog
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width - 48.0,
                  height: 100,
                  padding: const EdgeInsets.all(24.0),
                  child: TextButton(

                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)
                      )),
                      elevation: MaterialStateProperty.all(0.5),
                      backgroundColor: MaterialStateProperty.all(Colors.blue)
                    ),

                    child: widget.action == 0 
                    ? const Text(
                      'Thêm thực phẩm', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    )
                    : const Text(
                      'Lấy thực phẩm', 
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    onPressed: () async {

                      bool x = false;

                      // Xử lý thêm thực phẩm
                      if (widget.action == 0) {
                        await addFood(widget.message).then((value) => x = value);
                      }

                      // Xử lý lấy thực phẩm
                      else if (widget.action == 1) {
                        await removeFood(widget.message).then((value) => x = value);
                      }

                      Navigator.pop(context, true);
                      widget.callback(false);

                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: x ? const Text('Thành công!') : const Text('Lỗi!'),
                        ),
                      );

                    },

                  ),
                )
              )
            
            ],
          ),
        ),  
      )
    );
  }

}
