// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarangaydataStruct extends FFFirebaseStruct {
  BarangaydataStruct({
    String? name,
    int? votercount,
    int? membercount,
    int? membercheckins,
    int? activemembers,
    List<PpartylistStruct>? partylists,
    int? barangaynumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _votercount = votercount,
        _membercount = membercount,
        _membercheckins = membercheckins,
        _activemembers = activemembers,
        _partylists = partylists,
        _barangaynumber = barangaynumber,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "votercount" field.
  int? _votercount;
  int get votercount => _votercount ?? 0;
  set votercount(int? val) => _votercount = val;
  void incrementVotercount(int amount) => _votercount = votercount + amount;
  bool hasVotercount() => _votercount != null;

  // "membercount" field.
  int? _membercount;
  int get membercount => _membercount ?? 0;
  set membercount(int? val) => _membercount = val;
  void incrementMembercount(int amount) => _membercount = membercount + amount;
  bool hasMembercount() => _membercount != null;

  // "membercheckins" field.
  int? _membercheckins;
  int get membercheckins => _membercheckins ?? 0;
  set membercheckins(int? val) => _membercheckins = val;
  void incrementMembercheckins(int amount) =>
      _membercheckins = membercheckins + amount;
  bool hasMembercheckins() => _membercheckins != null;

  // "activemembers" field.
  int? _activemembers;
  int get activemembers => _activemembers ?? 0;
  set activemembers(int? val) => _activemembers = val;
  void incrementActivemembers(int amount) =>
      _activemembers = activemembers + amount;
  bool hasActivemembers() => _activemembers != null;

  // "partylists" field.
  List<PpartylistStruct>? _partylists;
  List<PpartylistStruct> get partylists => _partylists ?? const [];
  set partylists(List<PpartylistStruct>? val) => _partylists = val;
  void updatePartylists(Function(List<PpartylistStruct>) updateFn) =>
      updateFn(_partylists ??= []);
  bool hasPartylists() => _partylists != null;

  // "barangaynumber" field.
  int? _barangaynumber;
  int get barangaynumber => _barangaynumber ?? 0;
  set barangaynumber(int? val) => _barangaynumber = val;
  void incrementBarangaynumber(int amount) =>
      _barangaynumber = barangaynumber + amount;
  bool hasBarangaynumber() => _barangaynumber != null;

  static BarangaydataStruct fromMap(Map<String, dynamic> data) =>
      BarangaydataStruct(
        name: data['name'] as String?,
        votercount: castToType<int>(data['votercount']),
        membercount: castToType<int>(data['membercount']),
        membercheckins: castToType<int>(data['membercheckins']),
        activemembers: castToType<int>(data['activemembers']),
        partylists: getStructList(
          data['partylists'],
          PpartylistStruct.fromMap,
        ),
        barangaynumber: castToType<int>(data['barangaynumber']),
      );

  static BarangaydataStruct? maybeFromMap(dynamic data) => data is Map
      ? BarangaydataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'votercount': _votercount,
        'membercount': _membercount,
        'membercheckins': _membercheckins,
        'activemembers': _activemembers,
        'partylists': _partylists?.map((e) => e.toMap()).toList(),
        'barangaynumber': _barangaynumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'votercount': serializeParam(
          _votercount,
          ParamType.int,
        ),
        'membercount': serializeParam(
          _membercount,
          ParamType.int,
        ),
        'membercheckins': serializeParam(
          _membercheckins,
          ParamType.int,
        ),
        'activemembers': serializeParam(
          _activemembers,
          ParamType.int,
        ),
        'partylists': serializeParam(
          _partylists,
          ParamType.DataStruct,
          true,
        ),
        'barangaynumber': serializeParam(
          _barangaynumber,
          ParamType.int,
        ),
      }.withoutNulls;

  static BarangaydataStruct fromSerializableMap(Map<String, dynamic> data) =>
      BarangaydataStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        votercount: deserializeParam(
          data['votercount'],
          ParamType.int,
          false,
        ),
        membercount: deserializeParam(
          data['membercount'],
          ParamType.int,
          false,
        ),
        membercheckins: deserializeParam(
          data['membercheckins'],
          ParamType.int,
          false,
        ),
        activemembers: deserializeParam(
          data['activemembers'],
          ParamType.int,
          false,
        ),
        partylists: deserializeStructParam<PpartylistStruct>(
          data['partylists'],
          ParamType.DataStruct,
          true,
          structBuilder: PpartylistStruct.fromSerializableMap,
        ),
        barangaynumber: deserializeParam(
          data['barangaynumber'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BarangaydataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BarangaydataStruct &&
        name == other.name &&
        votercount == other.votercount &&
        membercount == other.membercount &&
        membercheckins == other.membercheckins &&
        activemembers == other.activemembers &&
        listEquality.equals(partylists, other.partylists) &&
        barangaynumber == other.barangaynumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        votercount,
        membercount,
        membercheckins,
        activemembers,
        partylists,
        barangaynumber
      ]);
}

BarangaydataStruct createBarangaydataStruct({
  String? name,
  int? votercount,
  int? membercount,
  int? membercheckins,
  int? activemembers,
  int? barangaynumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BarangaydataStruct(
      name: name,
      votercount: votercount,
      membercount: membercount,
      membercheckins: membercheckins,
      activemembers: activemembers,
      barangaynumber: barangaynumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BarangaydataStruct? updateBarangaydataStruct(
  BarangaydataStruct? barangaydata, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    barangaydata
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBarangaydataStructData(
  Map<String, dynamic> firestoreData,
  BarangaydataStruct? barangaydata,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (barangaydata == null) {
    return;
  }
  if (barangaydata.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && barangaydata.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final barangaydataData =
      getBarangaydataFirestoreData(barangaydata, forFieldValue);
  final nestedData =
      barangaydataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = barangaydata.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBarangaydataFirestoreData(
  BarangaydataStruct? barangaydata, [
  bool forFieldValue = false,
]) {
  if (barangaydata == null) {
    return {};
  }
  final firestoreData = mapToFirestore(barangaydata.toMap());

  // Add any Firestore field values
  barangaydata.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBarangaydataListFirestoreData(
  List<BarangaydataStruct>? barangaydatas,
) =>
    barangaydatas?.map((e) => getBarangaydataFirestoreData(e, true)).toList() ??
    [];
