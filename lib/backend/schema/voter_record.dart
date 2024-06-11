import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VoterRecord extends FirestoreRecord {
  VoterRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "voterstatus" field.
  String? _voterstatus;
  String get voterstatus => _voterstatus ?? '';
  bool hasVoterstatus() => _voterstatus != null;

  // "hasVoted" field.
  bool? _hasVoted;
  bool get hasVoted => _hasVoted ?? false;
  bool hasHasVoted() => _hasVoted != null;

  // "voterprecinct" field.
  String? _voterprecinct;
  String get voterprecinct => _voterprecinct ?? '';
  bool hasVoterprecinct() => _voterprecinct != null;

  // "voterbarangay" field.
  String? _voterbarangay;
  String get voterbarangay => _voterbarangay ?? '';
  bool hasVoterbarangay() => _voterbarangay != null;

  // "affiliation" field.
  String? _affiliation;
  String get affiliation => _affiliation ?? '';
  bool hasAffiliation() => _affiliation != null;

  // "fname" field.
  String? _fname;
  String get fname => _fname ?? '';
  bool hasFname() => _fname != null;

  // "lname" field.
  String? _lname;
  String get lname => _lname ?? '';
  bool hasLname() => _lname != null;

  // "generatedID" field.
  bool? _generatedID;
  bool get generatedID => _generatedID ?? false;
  bool hasGeneratedID() => _generatedID != null;

  // "fullname" field.
  String? _fullname;
  String get fullname => _fullname ?? '';
  bool hasFullname() => _fullname != null;

  // "seqno" field.
  int? _seqno;
  int get seqno => _seqno ?? 0;
  bool hasSeqno() => _seqno != null;

  // "stat" field.
  String? _stat;
  String get stat => _stat ?? '';
  bool hasStat() => _stat != null;

  // "sitio" field.
  String? _sitio;
  String get sitio => _sitio ?? '';
  bool hasSitio() => _sitio != null;

  // "votedTime" field.
  DateTime? _votedTime;
  DateTime? get votedTime => _votedTime;
  bool hasVotedTime() => _votedTime != null;

  // "mname" field.
  String? _mname;
  String get mname => _mname ?? '';
  bool hasMname() => _mname != null;

  void _initializeFields() {
    _voterstatus = snapshotData['voterstatus'] as String?;
    _hasVoted = snapshotData['hasVoted'] as bool?;
    _voterprecinct = snapshotData['voterprecinct'] as String?;
    _voterbarangay = snapshotData['voterbarangay'] as String?;
    _affiliation = snapshotData['affiliation'] as String?;
    _fname = snapshotData['fname'] as String?;
    _lname = snapshotData['lname'] as String?;
    _generatedID = snapshotData['generatedID'] as bool?;
    _fullname = snapshotData['fullname'] as String?;
    _seqno = castToType<int>(snapshotData['seqno']);
    _stat = snapshotData['stat'] as String?;
    _sitio = snapshotData['sitio'] as String?;
    _votedTime = snapshotData['votedTime'] as DateTime?;
    _mname = snapshotData['mname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('voter');

  static Stream<VoterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VoterRecord.fromSnapshot(s));

  static Future<VoterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VoterRecord.fromSnapshot(s));

  static VoterRecord fromSnapshot(DocumentSnapshot snapshot) => VoterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VoterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VoterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VoterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VoterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVoterRecordData({
  String? voterstatus,
  bool? hasVoted,
  String? voterprecinct,
  String? voterbarangay,
  String? affiliation,
  String? fname,
  String? lname,
  bool? generatedID,
  String? fullname,
  int? seqno,
  String? stat,
  String? sitio,
  DateTime? votedTime,
  String? mname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'voterstatus': voterstatus,
      'hasVoted': hasVoted,
      'voterprecinct': voterprecinct,
      'voterbarangay': voterbarangay,
      'affiliation': affiliation,
      'fname': fname,
      'lname': lname,
      'generatedID': generatedID,
      'fullname': fullname,
      'seqno': seqno,
      'stat': stat,
      'sitio': sitio,
      'votedTime': votedTime,
      'mname': mname,
    }.withoutNulls,
  );

  return firestoreData;
}

class VoterRecordDocumentEquality implements Equality<VoterRecord> {
  const VoterRecordDocumentEquality();

  @override
  bool equals(VoterRecord? e1, VoterRecord? e2) {
    return e1?.voterstatus == e2?.voterstatus &&
        e1?.hasVoted == e2?.hasVoted &&
        e1?.voterprecinct == e2?.voterprecinct &&
        e1?.voterbarangay == e2?.voterbarangay &&
        e1?.affiliation == e2?.affiliation &&
        e1?.fname == e2?.fname &&
        e1?.lname == e2?.lname &&
        e1?.generatedID == e2?.generatedID &&
        e1?.fullname == e2?.fullname &&
        e1?.seqno == e2?.seqno &&
        e1?.stat == e2?.stat &&
        e1?.sitio == e2?.sitio &&
        e1?.votedTime == e2?.votedTime &&
        e1?.mname == e2?.mname;
  }

  @override
  int hash(VoterRecord? e) => const ListEquality().hash([
        e?.voterstatus,
        e?.hasVoted,
        e?.voterprecinct,
        e?.voterbarangay,
        e?.affiliation,
        e?.fname,
        e?.lname,
        e?.generatedID,
        e?.fullname,
        e?.seqno,
        e?.stat,
        e?.sitio,
        e?.votedTime,
        e?.mname
      ]);

  @override
  bool isValidKey(Object? o) => o is VoterRecord;
}
