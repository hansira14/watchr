// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceStruct extends FFFirebaseStruct {
  AttendanceStruct({
    int? member,
    int? checkin,
    String? name,
    int? number,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _member = member,
        _checkin = checkin,
        _name = name,
        _number = number,
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

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  set number(int? val) => _number = val;
  void incrementNumber(int amount) => _number = number + amount;
  bool hasNumber() => _number != null;

  static AttendanceStruct fromMap(Map<String, dynamic> data) =>
      AttendanceStruct(
        member: castToType<int>(data['member']),
        checkin: castToType<int>(data['checkin']),
        name: data['name'] as String?,
        number: castToType<int>(data['number']),
      );

  static AttendanceStruct? maybeFromMap(dynamic data) => data is Map
      ? AttendanceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'member': _member,
        'checkin': _checkin,
        'name': _name,
        'number': _number,
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
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.int,
        ),
      }.withoutNulls;

  static AttendanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttendanceStruct(
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
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AttendanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendanceStruct &&
        member == other.member &&
        checkin == other.checkin &&
        name == other.name &&
        number == other.number;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([member, checkin, name, number]);
}

AttendanceStruct createAttendanceStruct({
  int? member,
  int? checkin,
  String? name,
  int? number,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttendanceStruct(
      member: member,
      checkin: checkin,
      name: name,
      number: number,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttendanceStruct? updateAttendanceStruct(
  AttendanceStruct? attendance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attendance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttendanceStructData(
  Map<String, dynamic> firestoreData,
  AttendanceStruct? attendance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attendance == null) {
    return;
  }
  if (attendance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attendance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attendanceData = getAttendanceFirestoreData(attendance, forFieldValue);
  final nestedData = attendanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attendance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttendanceFirestoreData(
  AttendanceStruct? attendance, [
  bool forFieldValue = false,
]) {
  if (attendance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attendance.toMap());

  // Add any Firestore field values
  attendance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttendanceListFirestoreData(
  List<AttendanceStruct>? attendances,
) =>
    attendances?.map((e) => getAttendanceFirestoreData(e, true)).toList() ?? [];
