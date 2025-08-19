// lib/features/tracking/presentation/screens/scanner_screen.dart
import 'package:flutter/cupertino.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Scan Product'),
      ),
      child: MobileScanner(
        // When a barcode is detected, this function is called
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          if (barcodes.isNotEmpty) {
            // We take the first barcode found and return its value
            final String? code = barcodes.first.rawValue;
            if (code != null) {
              // Pop the screen and send the code back to the dashboard
              Navigator.of(context).pop(code);
            }
          }
        },
      ),
    );
  }
}