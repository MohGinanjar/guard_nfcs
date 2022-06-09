import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nfc_guard_patrol/nfc_guard_patrol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NFCStatus? nfcStatus;
  String? mifareID;

  void checkSupport() async {
    final result = await NfcGuardPatrol.isNFCEnable();
    if (result != null) {
      setState(() {
        nfcStatus = result;
      });
    }
  }

  void readMifareId() async {
    final result = await NfcGuardPatrol.getId();
    if (result.isNotEmpty) {
      setState(() {
        mifareID = result;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkSupport();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mifare MMTZ Plugin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                nfcStatus != null
                    ? 'NFC Status: ${nfcStatus == NFCStatus.enabled ? 'ON' : 'OFF'}'
                    : 'NFC Status: OFF',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              Text(
                "NFC Mifare ID: $mifareID",
                style: TextStyle(
                    fontSize: 20
                ),
              ),

              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () => readMifareId(),
                child: Text(
                  "Read Mifare ID",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
    );
  }
}
