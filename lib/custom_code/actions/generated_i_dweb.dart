// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:js' as js;

Future generatedIDweb(
  String lname,
  String fname,
  String voterid,
  String precinct,
  String barangay,
  int seqno,
) async {
  final script = html.ScriptElement()
    ..src = "https://cdn.rawgit.com/davidshimjs/qrcodejs/gh-pages/qrcode.min.js"
    ..type = "text/javascript";
  final completer = Completer<void>();
  script.onLoad.listen((event) => completer.complete());
  script.onError
      .listen((event) => completer.completeError("Error loading script"));
  html.document.body?.append(script);
  await completer.future;

  final canvas = html.CanvasElement(width: 264, height: 384);
  final ctx = canvas.context2D;

  // Fetch the image using http
  final imageUrl =
      "https://raw.githubusercontent.com/courtech/watchr/main/final%20(1).png";
  final response = await http.get(Uri.parse(imageUrl));

  if (response.statusCode == 200) {
    final imageBlob = html.Blob([response.bodyBytes]);
    final imageUrl = html.Url.createObjectUrlFromBlob(imageBlob);

    final image = html.ImageElement(src: imageUrl);
    await image.onLoad.first;

    // Draw the image first to make it the background
    ctx.drawImage(image, 0, 0);

    // Now, draw other elements on top of the image
    // Generating QR Code
    final qrDiv = html.DivElement();
    html.document.body?.append(qrDiv); // Use ?. to handle potential null
    final qrCode = js.JsObject(js.context['QRCode'], [
      qrDiv,
      js.JsObject.jsify({'text': '$voterid', 'width': 150, 'height': 150})
    ]);

    await Future.delayed(Duration(milliseconds: 200)); // Let the QR code render

    final qrCanvas = qrDiv.querySelector('canvas') as html.CanvasElement;

    // Draw the generated QR code on the main canvas
    ctx.drawImageScaledFromSource(qrCanvas, 0, 0, 150, 150, 58, 145, 150, 150);

    // Cleanup
    qrDiv.remove();

    ctx.textAlign = 'left'; // Center align text
    ctx
      ..fillStyle = 'black'
      ..font = '600 12px sans-serif'
      ..fillText('$lname', 57, 109)
      ..fillStyle = 'black'
      ..font = '600 12px sans-serif'
      ..fillText('$fname', 57, 126)
      ..font =
          '9px "Open Sans", sans-serif' // Specify "Open Sans" as the font family
      ..fillStyle = 'black'
      ..fillText('Prec No:$precinct', 57, 317);
    ctx.textAlign = 'right'; // Set text alignment to right
    ctx
      ..font =
          '9px "Open Sans", sans-serif' // Specify "Open Sans" as the font family
      ..fillStyle = 'black'
      ..fillText('Seq No:$seqno', 204, 317);
    // Revoke the object URL to release resources
    html.Url.revokeObjectUrl(imageUrl);
//Download
    final dataUrl = canvas.toDataUrl("image/png");
    final anchor = html.AnchorElement(href: dataUrl)
      ..target = 'blank'
      ..download = '${barangay}_${lname}_${fname}.png'
      ..click();
  }
}
