// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PpartylistStruct extends FFFirebaseStruct {
  PpartylistStruct({
    String? partylistname,
    int? partycount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _partylistname = partylistname,
        _partycount = partycount,
        super(firestoreUtilData);

  // "partylistname" field.
  String? _partylistname;
  String get partylistname => _partylistname ?? '';
  set partylistname(String? val) => _partylistname = val;
  bool hasPartylistname() => _partylistname != null;

  // "partycount" field.
  int? _partycount;
  int get partycount => _partycount ?? 0;
  set partycount(int? val) => _partycount = val;
  void incrementPartycount(int amount) => _partycount = partycount + amount;
  bool hasPartycount() => _partycount != null;

  static PpartylistStruct fromMap(Map<String, dynamic> data) =>
      PpartylistStruct(
        partylistname: data['partylistname'] as String?,
        partycount: castToType<int>(data['partycount']),
      );

  static PpartylistStruct? maybeFromMap(dynamic data) => data is Map
      ? PpartylistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'partylistname': _partylistname,
        'partycount': _partycount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'partylistname': serializeParam(
          _partylistname,
          ParamType.String,
        ),
        'partycount': serializeParam(
          _partycount,
          ParamType.int,
        ),
      }.withoutNulls;

  static PpartylistStruct fromSerializableMap(Map<String, dynamic> data) =>
      PpartylistStruct(
        partylistname: deserializeParam(
          data['partylistname'],
          ParamType.String,
          false,
        ),
        partycount: deserializeParam(
          data['partycount'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PpartylistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PpartylistStruct &&
        partylistname == other.partylistname &&
        partycount == other.partycount;
  }

  @override
  int get hashCode => const ListEquality().hash([partylistname, partycount]);
}

PpartylistStruct createPpartylistStruct({
  String? partylistname,
  int? partycount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PpartylistStruct(
      partylistname: partylistname,
      partycount: partycount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PpartylistStruct? updatePpartylistStruct(
  PpartylistStruct? ppartylist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ppartylist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPpartylistStructData(
  Map<String, dynamic> firestoreData,
  PpartylistStruct? ppartylist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ppartylist == null) {
    return;
  }
  if (ppartylist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ppartylist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ppartylistData = getPpartylistFirestoreData(ppartylist, forFieldValue);
  final nestedData = ppartylistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ppartylist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPpartylistFirestoreData(
  PpartylistStruct? ppartylist, [
  bool forFieldValue = false,
]) {
  if (ppartylist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ppartylist.toMap());

  // Add any Firestore field values
  ppartylist.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPpartylistListFirestoreData(
  List<PpartylistStruct>? ppartylists,
) =>
    ppartylists?.map((e) => getPpartylistFirestoreData(e, true)).toList() ?? [];
