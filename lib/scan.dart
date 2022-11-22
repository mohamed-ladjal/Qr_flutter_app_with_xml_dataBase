import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mini_project_xml/form.dart';

class ScanPage extends StatefulWidget {
  var document;
  String contats;
  final Function callbackFunction;
  ScanPage(
      {required this.callbackFunction,
      required this.contats,
      required this.document});
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  var qrCodeResult = "Not Yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanner"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Result",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              qrCodeResult,
              style: TextStyle(
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            TextButton(
              onPressed: () async {
                final navigator = Navigator.of(context); // store the Navigator

                var codeSanner = await FlutterBarcodeScanner.scanBarcode(
                    "", "CANCEL", false, ScanMode.QR);
                // await showDialog(
                //   context: context,
                //   builder: (_) => AlertDialog(
                //     title: Text('Dialog Title'),
                //   ),
                // );
                navigator.push(MaterialPageRoute(
                    builder: (context) => MyCustomForm(
                          first_name: codeSanner.split('\n')[0],
                          last_name: codeSanner.split('\n')[1],
                          city: codeSanner.split('\n')[2],
                          country: codeSanner.split('\n')[3],
                          email: codeSanner.split('\n')[4],
                          phone: codeSanner.split('\n')[5],
                          document: widget.document,
                          contats: widget.contats,
                          callbackFunction: widget.callbackFunction,
                        ))); //barcode scnner
                setState(() {
                  qrCodeResult = codeSanner;
                });

                // try{
                //   BarcodeScanner.scan()    this method is used to scan the QR code
                // }catch (e){
                //   BarcodeScanner.CameraAccessDenied;   we can print that user has denied for the permisions
                //   BarcodeScanner.UserCanceled;   we can print on the page that user has cancelled
                // }
              },
              child: Text(
                "Open Scanner",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  //its quite simple as that you can use try and catch staatements too for platform exception
}
