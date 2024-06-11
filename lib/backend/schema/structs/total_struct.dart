// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalStruct extends FFFirebaseStruct {
  TotalStruct({
    int? member,
    int? checkin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _member = member,
        _checkin = checkin,
        super(firestoreUtilData);

  // "member" field.
  int? _member;
  int get member => _member ?? 0;
  set member(int? val) => _member = val;
  void incrementMember(int amount) => _member = member + amount;
  bool hasMember() => _member != null;

  // "checkin" field.
  int? _checkin;
  int get checkin => _checkin ?? 0;
  set checkin(int? val) => _checkin = val;
  void incrementCheckin(int amount) => _checkin = checkin + amount;
  bool hasCheckin() => _checkin != null;

  static TotalStruct fromMap(Map<String, dynamic> data) => TotalStruct(
        member: castToType<int>(data['member']),
        checkin: castToType<int>(data['checkin']),
      );

  static TotalStruct? maybeFromMap(dynamic data) =>
      data is Map ? TotalStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'member': _member,
        'checkin': _checkin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'member': serializeParam(
          _member,
          ParamType.int,
        ),
        'checkin': serializeParam(
          _checkin,
          ParamType.int,
        ),
      }.withoutNulls;

  static TotalStruct fromSerializableMap(Map<String, dynamic> data) =>
      TotalStruct(
        member: deserializeParam(
          data['member'],
          ParamType.int,
          false,
        ),
        checkin: deserializeParam(
          data['checkin'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TotalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TotalStruct &&
        member == other.member &&
        checkin == other.checkin;
  }

  @override
  int get hashCode => const ListEquality().hash([member, checkin]);
}

TotalStruct createTotalStruct({
  int? member,
  int? checkin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TotalStruct(
      member: member,
      checkin: checkin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TotalStruct? updateTotalStruct(
  TotalStruct? total, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    total
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTotalStructData(
  Map<String, dynamic> firestoreData,
  TotalStruct? total,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (total == null) {
    return;
  }
  if (total.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && total.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final totalData = getTotalFirestoreData(total, forFieldValue);
  final nestedData = totalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = total.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTotalFirestoreData(
  TotalStruct? total, [
  bool forFieldValue = false,
]) {
  if (total == null) {
    return {};
  }
  final firestoreData = mapToFirestore(total.toMap());

  // Add any Firestore field values
  total.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTotalListFirestoreData(
  List<TotalStruct>? totals,
) =>
    totals?.map((e) => getTotalFirestoreData(e, true)).toList() ?? [];
