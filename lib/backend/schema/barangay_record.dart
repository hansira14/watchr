import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarangayRecord extends FirestoreRecord {
  BarangayRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "barangayname" field.
  String? _barangayname;
  String get barangayname => _barangayname ?? '';
  bool hasBarangayname() => _barangayname != null;

  // "totalVoters" field.
  int? _totalVoters;
  int get totalVoters => _totalVoters ?? 0;
  bool hasTotalVoters() => _totalVoters != null;

  // "barangayid" field.
  int? _barangayid;
  int get barangayid => _barangayid ?? 0;
  bool hasBarangayid() => _barangayid != null;

  void _initializeFields() {
    _barangayname = snapshotData['barangayname'] as String?;
    _totalVoters = castToType<int>(snapshotData['totalVoters']);
    _barangayid = castToType<int>(snapshotData['barangayid']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('barangay');

  static Stream<BarangayRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BarangayRecord.fromSnapshot(s));

  static Future<BarangayRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BarangayRecord.fromSnapshot(s));

  static BarangayRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BarangayRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BarangayRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BarangayRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BarangayRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BarangayRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBarangayRecordData({
  String? barangayname,
  int? totalVoters,
  int? barangayid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barangayname': barangayname,
      'totalVoters': totalVoters,
      'barangayid': barangayid,
    }.withoutNulls,
  );

  return firestoreData;
}

class BarangayRecordDocumentEquality implements Equality<BarangayRecord> {
  const BarangayRecordDocumentEquality();

  @override
  bool equals(BarangayRecord? e1, BarangayRecord? e2) {
    return e1?.barangayname == e2?.barangayname &&
        e1?.totalVoters == e2?.totalVoters &&
        e1?.barangayid == e2?.barangayid;
  }

  @override
  int hash(BarangayRecord? e) => const ListEquality()
      .hash([e?.barangayname, e?.totalVoters, e?.barangayid]);

  @override
  bool isValidKey(Object? o) => o is BarangayRecord;
}
