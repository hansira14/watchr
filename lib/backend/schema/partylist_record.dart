import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class PartylistRecord extends FirestoreRecord {
  PartylistRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "partylist" field.
  String? _partylist;
  String get partylist => _partylist ?? '';
  bool hasPartylist() => _partylist != null;

  void _initializeFields() {
    _partylist = snapshotData['partylist'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('partylist');

  static Stream<PartylistRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PartylistRecord.fromSnapshot(s));

  static Future<PartylistRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PartylistRecord.fromSnapshot(s));

  static PartylistRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PartylistRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PartylistRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PartylistRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PartylistRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PartylistRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPartylistRecordData({
  String? partylist,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'partylist': partylist,
    }.withoutNulls,
  );

  return firestoreData;
}

class PartylistRecordDocumentEquality implements Equality<PartylistRecord> {
  const PartylistRecordDocumentEquality();

  @override
  bool equals(PartylistRecord? e1, PartylistRecord? e2) {
    return e1?.partylist == e2?.partylist;
  }

  @override
  int hash(PartylistRecord? e) => const ListEquality().hash([e?.partylist]);

  @override
  bool isValidKey(Object? o) => o is PartylistRecord;
}
