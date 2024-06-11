import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _pendingscan = prefs.getInt('ff_pendingscan') ?? _pendingscan;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _icon = '';
  String get icon => _icon;
  set icon(String value) {
    _icon = value;
  }

  List<String> _barangaylist = [
    'Banat-i',
    'Basud',
    'Bawod',
    'Biasong',
    'Bunacan',
    'Busay',
    'Cabungaan',
    'Capinahan',
    'Crossing',
    'Daja-Daku',
    'Daja-Diot',
    'Hda. Maria',
    'Linao',
    'Matungao',
    'Paril',
    'San Miguel',
    'San Jose',
    'Taglawigan',
    'Tinago'
  ];
  List<String> get barangaylist => _barangaylist;
  set barangaylist(List<String> value) {
    _barangaylist = value;
  }

  void addToBarangaylist(String value) {
    _barangaylist.add(value);
  }

  void removeFromBarangaylist(String value) {
    _barangaylist.remove(value);
  }

  void removeAtIndexFromBarangaylist(int index) {
    _barangaylist.removeAt(index);
  }

  void updateBarangaylistAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _barangaylist[index] = updateFn(_barangaylist[index]);
  }

  void insertAtIndexInBarangaylist(int index, String value) {
    _barangaylist.insert(index, value);
  }

  int _pendingscan = 0;
  int get pendingscan => _pendingscan;
  set pendingscan(int value) {
    _pendingscan = value;
    prefs.setInt('ff_pendingscan', value);
  }

  List<AttendanceStruct> _barangayattendance = [
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Banat-i\",\"number\":\"1\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Basud\",\"number\":\"2\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Bawod\",\"number\":\"3\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Biasong\",\"number\":\"4\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Bunacan\",\"number\":\"5\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Busay\",\"number\":\"6\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Cabungaan\",\"number\":\"7\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Capinahan\",\"number\":\"8\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Crossing\",\"number\":\"9\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Daja-Daku\",\"number\":\"10\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Daja-Diot\",\"number\":\"11\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Hda. Maria\",\"number\":\"12\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Linao\",\"number\":\"13\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Matungao\",\"number\":\"14\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Paril\",\"number\":\"15\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"San Jose\",\"number\":\"16\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"San Miguel\",\"number\":\"17\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Taglawigan\",\"number\":\"18\"}')),
    AttendanceStruct.fromSerializableMap(jsonDecode(
        '{\"member\":\"0\",\"checkin\":\"0\",\"name\":\"Tinago\",\"number\":\"19\"}'))
  ];
  List<AttendanceStruct> get barangayattendance => _barangayattendance;
  set barangayattendance(List<AttendanceStruct> value) {
    _barangayattendance = value;
  }

  void addToBarangayattendance(AttendanceStruct value) {
    _barangayattendance.add(value);
  }

  void removeFromBarangayattendance(AttendanceStruct value) {
    _barangayattendance.remove(value);
  }

  void removeAtIndexFromBarangayattendance(int index) {
    _barangayattendance.removeAt(index);
  }

  void updateBarangayattendanceAtIndex(
    int index,
    AttendanceStruct Function(AttendanceStruct) updateFn,
  ) {
    _barangayattendance[index] = updateFn(_barangayattendance[index]);
  }

  void insertAtIndexInBarangayattendance(int index, AttendanceStruct value) {
    _barangayattendance.insert(index, value);
  }

  final _votersManager = FutureRequestManager<List<VoterRecord>>();
  Future<List<VoterRecord>> voters({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VoterRecord>> Function() requestFn,
  }) =>
      _votersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVotersCache() => _votersManager.clear();
  void clearVotersCacheKey(String? uniqueKey) =>
      _votersManager.clearRequest(uniqueKey);

  final _voterscannerManager = StreamRequestManager<List<VoterRecord>>();
  Stream<List<VoterRecord>> voterscanner({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<VoterRecord>> Function() requestFn,
  }) =>
      _voterscannerManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVoterscannerCache() => _voterscannerManager.clear();
  void clearVoterscannerCacheKey(String? uniqueKey) =>
      _voterscannerManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
