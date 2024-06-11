import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatisticsAttendanceRecord extends FirestoreRecord {
  StatisticsAttendanceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "barangayname" field.
  String? _barangayname;
  String get barangayname => _barangayname ?? '';
  bool hasBarangayname() => _barangayname != null;

  // "membercount" field.
  int? _membercount;
  int get membercount => _membercount ?? 0;
  bool hasMembercount() => _membercount != null;

  // "membercheckins" field.
  int? _membercheckins;
  int get membercheckins => _membercheckins ?? 0;
  bool hasMembercheckins() => _membercheckins != null;

  // "votercount" field.
  int? _votercount;
  int get votercount => _votercount ?? 0;
  bool hasVotercount() => _votercount != null;

  void _initializeFields() {
    _barangayname = snapshotData['barangayname'] as String?;
    _membercount = castToType<int>(snapshotData['membercount']);
    _membercheckins = castToType<int>(snapshotData['membercheckins']);
    _votercount = castToType<int>(snapshotData['votercount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('statistics_attendance');

  static Stream<StatisticsAttendanceRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => StatisticsAttendanceRecord.fromSnapshot(s));

  static Future<StatisticsAttendanceRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => StatisticsAttendanceRecord.fromSnapshot(s));

  static StatisticsAttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StatisticsAttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatisticsAttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatisticsAttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatisticsAttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatisticsAttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatisticsAttendanceRecordData({
  String? barangayname,
  int? membercount,
  int? membercheckins,
  int? votercount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barangayname': barangayname,
      'membercount': membercount,
      'membercheckins': membercheckins,
      'votercount': votercount,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatisticsAttendanceRecordDocumentEquality
    implements Equality<StatisticsAttendanceRecord> {
  const StatisticsAttendanceRecordDocumentEquality();

  @override
  bool equals(StatisticsAttendanceRecord? e1, StatisticsAttendanceRecord? e2) {
    return e1?.barangayname == e2?.barangayname &&
        e1?.membercount == e2?.membercount &&
        e1?.membercheckins == e2?.membercheckins &&
        e1?.votercount == e2?.votercount;
  }

  @override
  int hash(StatisticsAttendanceRecord? e) => const ListEquality().hash(
      [e?.barangayname, e?.membercount, e?.membercheckins, e?.votercount]);

  @override
  bool isValidKey(Object? o) => o is StatisticsAttendanceRecord;
}
