import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarangaystatsRecord extends FirestoreRecord {
  BarangaystatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "votercount" field.
  int? _votercount;
  int get votercount => _votercount ?? 0;
  bool hasVotercount() => _votercount != null;

  // "membercount" field.
  int? _membercount;
  int get membercount => _membercount ?? 0;
  bool hasMembercount() => _membercount != null;

  // "membercheckins" field.
  int? _membercheckins;
  int get membercheckins => _membercheckins ?? 0;
  bool hasMembercheckins() => _membercheckins != null;

  // "activemembers" field.
  int? _activemembers;
  int get activemembers => _activemembers ?? 0;
  bool hasActivemembers() => _activemembers != null;

  // "barangaynumber" field.
  int? _barangaynumber;
  int get barangaynumber => _barangaynumber ?? 0;
  bool hasBarangaynumber() => _barangaynumber != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _votercount = castToType<int>(snapshotData['votercount']);
    _membercount = castToType<int>(snapshotData['membercount']);
    _membercheckins = castToType<int>(snapshotData['membercheckins']);
    _activemembers = castToType<int>(snapshotData['activemembers']);
    _barangaynumber = castToType<int>(snapshotData['barangaynumber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('barangaystats');

  static Stream<BarangaystatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BarangaystatsRecord.fromSnapshot(s));

  static Future<BarangaystatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BarangaystatsRecord.fromSnapshot(s));

  static BarangaystatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BarangaystatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BarangaystatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BarangaystatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BarangaystatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BarangaystatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBarangaystatsRecordData({
  String? name,
  int? votercount,
  int? membercount,
  int? membercheckins,
  int? activemembers,
  int? barangaynumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'votercount': votercount,
      'membercount': membercount,
      'membercheckins': membercheckins,
      'activemembers': activemembers,
      'barangaynumber': barangaynumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class BarangaystatsRecordDocumentEquality
    implements Equality<BarangaystatsRecord> {
  const BarangaystatsRecordDocumentEquality();

  @override
  bool equals(BarangaystatsRecord? e1, BarangaystatsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.votercount == e2?.votercount &&
        e1?.membercount == e2?.membercount &&
        e1?.membercheckins == e2?.membercheckins &&
        e1?.activemembers == e2?.activemembers &&
        e1?.barangaynumber == e2?.barangaynumber;
  }

  @override
  int hash(BarangaystatsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.votercount,
        e?.membercount,
        e?.membercheckins,
        e?.activemembers,
        e?.barangaynumber
      ]);

  @override
  bool isValidKey(Object? o) => o is BarangaystatsRecord;
}
