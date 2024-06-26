import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "scans" field.
  int? _scans;
  int get scans => _scans ?? 0;
  bool hasScans() => _scans != null;

  // "lastAction" field.
  DateTime? _lastAction;
  DateTime? get lastAction => _lastAction;
  bool hasLastAction() => _lastAction != null;

  // "acccreated" field.
  DateTime? _acccreated;
  DateTime? get acccreated => _acccreated;
  bool hasAcccreated() => _acccreated != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "pending" field.
  bool? _pending;
  bool get pending => _pending ?? false;
  bool hasPending() => _pending != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _barangay = snapshotData['barangay'] as String?;
    _scans = castToType<int>(snapshotData['scans']);
    _lastAction = snapshotData['lastAction'] as DateTime?;
    _acccreated = snapshotData['acccreated'] as DateTime?;
    _verified = snapshotData['verified'] as bool?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _pending = snapshotData['pending'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? type,
  String? barangay,
  int? scans,
  DateTime? lastAction,
  DateTime? acccreated,
  bool? verified,
  String? phoneNumber,
  bool? pending,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'type': type,
      'barangay': barangay,
      'scans': scans,
      'lastAction': lastAction,
      'acccreated': acccreated,
      'verified': verified,
      'phone_number': phoneNumber,
      'pending': pending,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.type == e2?.type &&
        e1?.barangay == e2?.barangay &&
        e1?.scans == e2?.scans &&
        e1?.lastAction == e2?.lastAction &&
        e1?.acccreated == e2?.acccreated &&
        e1?.verified == e2?.verified &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.pending == e2?.pending;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.type,
        e?.barangay,
        e?.scans,
        e?.lastAction,
        e?.acccreated,
        e?.verified,
        e?.phoneNumber,
        e?.pending
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
