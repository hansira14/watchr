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

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;

Future<void> downloadReport(
  BuildContext context,
  List<BarangaydataStruct> barangaydata,
) async {
  try {
    final List<List<dynamic>> rows = [];

    // Add CSV headers
    rows.add(
        ["Barangay", "Voters", "Members", "Checkins", "Active", "Partylists"]);

    // Add data for each barangay
    for (var data in barangaydata) {
      rows.add([
        data.name,
        data.votercount,
        data.membercount,
        data.membercheckins,
        data.activemembers,
        data.partylists,
      ]);
    }

    String csv = const ListToCsvConverter().convert(rows);

    final blob = html.Blob([Uint8List.fromList(utf8.encode(csv))]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..target = 'blank'
      ..download = 'barangay_report.csv'
      ..click();
    html.Url.revokeObjectUrl(url);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.toString())),
    );
  }
}
