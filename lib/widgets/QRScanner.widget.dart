import 'package:finance_mobile_app/theme/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanner extends StatelessWidget {
  static const String routeName = "qr-scanner";

  const QRScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.noDuplicates,
                  detectionTimeoutMs: 500,
                ),
                onDetect: (scanData) {
                  HapticFeedback.heavyImpact();
                  List<Barcode> barcodes = scanData.barcodes;

                  Barcode lastDetected = barcodes.last;

                  Navigator.of(context).pop(lastDetected.rawValue);
                }),
            QRScannerOverlay(
              overlayColour: Theme.of(context).primaryColor.withOpacity(.2),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 27),
              child: const Align(
                alignment: Alignment.topCenter,
                child: Text("Scan for Payment", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20.0),),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class QRScannerOverlay extends StatelessWidget {
  const QRScannerOverlay({Key? key, required this.overlayColour})
      : super(key: key);

  final Color overlayColour;

  @override
  Widget build(BuildContext context) {
    double scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 200.0
        : 330.0;
    return Stack(children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
            overlayColour, BlendMode.srcOut), // This one will create the magic
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  backgroundBlendMode: BlendMode
                      .dstOut), // This one will handle background + difference out
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: scanArea,
                width: scanArea,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: CustomPaint(
          foregroundPainter: BorderPainter(),
          child: SizedBox(
            width: scanArea + 25,
            height: scanArea + 25,
          ),
        ),
      ),
    ]);
  }
}

// Creates the white borders
class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const width = 4.0;
    const radius = 20.0;
    const tRadius = 3 * radius;
    final rect = Rect.fromLTWH(
      width,
      width,
      size.width - 2 * width,
      size.height - 2 * width,
    );
    final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
    const clippingRect0 = Rect.fromLTWH(
      0,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect1 = Rect.fromLTWH(
      size.width - tRadius,
      0,
      tRadius,
      tRadius,
    );
    final clippingRect2 = Rect.fromLTWH(
      0,
      size.height - tRadius,
      tRadius,
      tRadius,
    );
    final clippingRect3 = Rect.fromLTWH(
      size.width - tRadius,
      size.height - tRadius,
      tRadius,
      tRadius,
    );

    final path = Path()
      ..addRect(clippingRect0)
      ..addRect(clippingRect1)
      ..addRect(clippingRect2)
      ..addRect(clippingRect3);

    canvas.clipPath(path);
    canvas.drawRRect(
      rrect,
      Paint()
        ..color = primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = width,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class BarReaderSize {
  static double width = 200;
  static double height = 200;
}

class OverlayWithHolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black54;
    canvas.drawPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
          Path()
            ..addOval(Rect.fromCircle(
                center: Offset(size.width - 44, size.height - 44), radius: 40))
            ..close(),
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) {
  return false;
}
