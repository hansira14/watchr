import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<BarangaydataStruct> barangaydata(List<VoterRecord> checkinlist) {
  Map<String, BarangaydataStruct> barangayMap = {};

  for (VoterRecord record in checkinlist) {
    String barangay = record.voterbarangay;

    if (!barangayMap.containsKey(barangay)) {
      barangayMap[barangay] = BarangaydataStruct(
        name: barangay,
        votercount: 0,
        membercount: 0,
        activemembers: 0,
        partylists: [],
        barangaynumber: 0,
        membercheckins: 0,
      );
    }

    BarangaydataStruct barangayData = barangayMap[barangay]!;
    barangayData.votercount++;

    if (record.affiliation == 'Hugpong') {
      barangayData.membercount++;
      if (record.voterstatus == 'ACTIVE') {
        barangayData.activemembers++;
      }
      if (record.hasVoted == true) {
        barangayData.membercheckins++;
      }
    }

    // if (record.voterstatus == 'active' && record.affiliation == 'Hugpong') {
    //   barangayData.activemembers++;
    // }

    // Update partylists
    bool partyExists = false;
    for (PpartylistStruct party in barangayData.partylists) {
      if (party.partylistname == record.affiliation) {
        party.partycount++;
        partyExists = true;
        break;
      }
    }
    if (!partyExists) {
      barangayData.partylists.add(
          PpartylistStruct(partylistname: record.affiliation, partycount: 1));
    }
  }

  // Convert the map values to a list and sort by barangayname
  List<BarangaydataStruct> sortedList = barangayMap.values.toList()
    ..sort((a, b) => a.name.compareTo(b.name));

  // Set the barangaynumber based on index
  for (int i = 0; i < sortedList.length; i++) {
    sortedList[i].barangaynumber =
        i + 1; // Assuming you want to start with 1 instead of 0
  }

  return sortedList;
}

DocumentReference getDocumentReference(String documentID) {
  return FirebaseFirestore.instance.collection('voter').doc(documentID);
}

List<AttendanceStruct> barangaydata2(List<VoterRecord> checkinlist) {
  Map<String, AttendanceStruct> barangayMap = {};

  for (VoterRecord record in checkinlist) {
    String barangay = record.voterbarangay;

    if (!barangayMap.containsKey(barangay)) {
      barangayMap[barangay] = AttendanceStruct(
        name: barangay,
        member: 0,
        checkin: 0,
      );
    }

    AttendanceStruct barangayData = barangayMap[barangay]!;
    barangayData.member++;

    if (record.hasVoted == true) {
      barangayData.checkin++;
    }
  }

  // Convert the map values to a list and sort by barangayname
  List<AttendanceStruct> sortedList = barangayMap.values.toList()
    ..sort((a, b) => a.name.compareTo(b.name));

  // Set the barangaynumber based on index
  for (int i = 0; i < sortedList.length; i++) {
    sortedList[i].number =
        i + 1; // Assuming you want to start with 1 instead of 0
  }

  return sortedList;
}

bool isActive(DateTime? lastAction) {
  if (lastAction == null) {
    return false; // Return false if lastAction is null
  }
  // if dateTime is more than 5 minutes ago, return false
  final now = DateTime.now();
  final difference = now.difference(lastAction);
  return difference.inMinutes < 5;
}

List<PpartylistStruct> partylistdata(List<VoterRecord> voterlist) {
  // get the list of partylist with their total number of voters
  Map<String, int> partylistCount = {};

  for (VoterRecord voter in voterlist) {
    if (partylistCount.containsKey(voter.affiliation!)) {
      partylistCount[voter.affiliation!] =
          partylistCount[voter.affiliation!]! + 1;
    } else {
      partylistCount[voter.affiliation!] = 1;
    }
  }

  List<PpartylistStruct> partylistStructList = [];

  partylistCount.forEach((key, value) {
    partylistStructList
        .add(PpartylistStruct(partylistname: key, partycount: value));
  });

  return partylistStructList;
}

List<String> barangayoptions(
  List<VoterRecord> voterlist,
  String type,
) {
  Set<String> uniqueValues = {};

  for (var voter in voterlist) {
    switch (type) {
      case 'precinct':
        uniqueValues.add(voter.voterprecinct);
        break;
      case 'status':
        uniqueValues.add(voter.voterstatus);
        break;
      case 'affiliation':
        uniqueValues.add(voter.affiliation);
        break;
      default:
        break;
    }
  }

  List<String> result = uniqueValues.toList();
  return result;
}

List<String> precinctlist() {
  return [
    "10A",
    "10B",
    "10C",
    "11A",
    "11B",
    "11C",
    "12A",
    "12B",
    "13A",
    "13B",
    "14A",
    "14B",
    "15A",
    "15B",
    "15C",
    "16A",
    "17A",
    "17B",
    "18A",
    "18B",
    "19A",
    "19B",
    "1A",
    "1B",
    "20A",
    "21A",
    "21B",
    "22A",
    "22B",
    "23A",
    "24A",
    "24B",
    "25A",
    "25B",
    "26A",
    "26B",
    "26C",
    "27A",
    "27B",
    "27C",
    "28A",
    "28B",
    "28C",
    "29A",
    "29B",
    "29C",
    "2A",
    "2B",
    "30A",
    "30B",
    "31A",
    "31B",
    "32A",
    "32B",
    "33A",
    "33B",
    "34A",
    "34B",
    "35A",
    "35B",
    "36A",
    "36B",
    "37A",
    "37B",
    "38A",
    "39A",
    "39B",
    "3A",
    "40A",
    "40B",
    "41A",
    "41B",
    "42A",
    "42B",
    "43A",
    "43B",
    "44A",
    "44B",
    "44C",
    "45A",
    "45B",
    "45C",
    "46A",
    "46B",
    "47A",
    "47B",
    "48A",
    "48B",
    "49A",
    "49B",
    "4A",
    "4B",
    "50A",
    "50B",
    "51A",
    "51B",
    "52A",
    "52B",
    "52C",
    "53A",
    "53B",
    "54A",
    "54B",
    "55A",
    "56A",
    "57A",
    "57B",
    "58A",
    "58B",
    "59A",
    "59B",
    "59C",
    "5A",
    "60A",
    "60B",
    "61A",
    "61B",
    "62A",
    "62B",
    "63A",
    "63B",
    "64A",
    "64B",
    "65A",
    "65B",
    "66A",
    "66B",
    "67A",
    "67B",
    "68A",
    "68B",
    "6A",
    "7A",
    "7B",
    "7C",
    "8A",
    "8B",
    "8C",
    "9A",
    "9B",
    "9C",
    "n/a",
  ];
}

int totalmember(List<BarangaystatsRecord> data) {
  int members = 0;

  // Iterate through the data and sum up the membercount and membercheckins
  for (final record in data) {
    members += record.membercount ?? 0;
  }
  return members;
}

int totalvoter(List<BarangaystatsRecord> data) {
  int value = 0;

  // Iterate through the data and sum up the membercount and membercheckins
  for (final record in data) {
    value += record.votercount ?? 0;
  }
  return value;
}

int totalactive(List<BarangaystatsRecord> data) {
  int value = 0;

  // Iterate through the data and sum up the membercount and membercheckins
  for (final record in data) {
    value += record.activemembers ?? 0;
  }
  return value;
}

int totalcheckin(List<BarangaystatsRecord> data) {
  int checkin = 0;

  // Iterate through the data and sum up the membercount and membercheckins
  for (final record in data) {
    checkin += record.membercheckins ?? 0;
  }
  return checkin;
}
