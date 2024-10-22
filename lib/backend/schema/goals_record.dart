import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalsRecord extends FirestoreRecord {
  GoalsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "carbon" field.
  int? _carbon;
  int get carbon => _carbon ?? 0;
  bool hasCarbon() => _carbon != null;

  // "frequency" field.
  DateTime? _frequency;
  DateTime? get frequency => _frequency;
  bool hasFrequency() => _frequency != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  // "intensity" field.
  String? _intensity;
  String get intensity => _intensity ?? '';
  bool hasIntensity() => _intensity != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created" field.
  DateTime? _created;
  DateTime? get created => _created;
  bool hasCreated() => _created != null;

  void _initializeFields() {
    _action = snapshotData['action'] as String?;
    _carbon = castToType<int>(snapshotData['carbon']);
    _frequency = snapshotData['frequency'] as DateTime?;
    _time = castToType<int>(snapshotData['time']);
    _intensity = snapshotData['intensity'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('goals');

  static Stream<GoalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GoalsRecord.fromSnapshot(s));

  static Future<GoalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GoalsRecord.fromSnapshot(s));

  static GoalsRecord fromSnapshot(DocumentSnapshot snapshot) => GoalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GoalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GoalsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GoalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GoalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGoalsRecordData({
  String? action,
  int? carbon,
  DateTime? frequency,
  int? time,
  String? intensity,
  DateTime? date,
  DocumentReference? user,
  DateTime? created,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'action': action,
      'carbon': carbon,
      'frequency': frequency,
      'time': time,
      'intensity': intensity,
      'date': date,
      'user': user,
      'created': created,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalsRecordDocumentEquality implements Equality<GoalsRecord> {
  const GoalsRecordDocumentEquality();

  @override
  bool equals(GoalsRecord? e1, GoalsRecord? e2) {
    return e1?.action == e2?.action &&
        e1?.carbon == e2?.carbon &&
        e1?.frequency == e2?.frequency &&
        e1?.time == e2?.time &&
        e1?.intensity == e2?.intensity &&
        e1?.date == e2?.date &&
        e1?.user == e2?.user &&
        e1?.created == e2?.created;
  }

  @override
  int hash(GoalsRecord? e) => const ListEquality().hash([
        e?.action,
        e?.carbon,
        e?.frequency,
        e?.time,
        e?.intensity,
        e?.date,
        e?.user,
        e?.created
      ]);

  @override
  bool isValidKey(Object? o) => o is GoalsRecord;
}
