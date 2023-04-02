import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


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
          : MaterialStateProperty.all(Colors.black)
      ),
      onPressed: () {
        setState(() {
          flashIconPressed = !flashIconPressed;
          // (widget.controller)!.toggleFlash();
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
  const FoodManagementSelection({super.key});

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
            setState(() {
              segmentedControlGroupValue = i!;
            });
          }
    );
  }

}