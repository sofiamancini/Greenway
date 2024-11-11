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

  // "frequency" field.
  String? _frequency;
  String get frequency => _frequency ?? '';
  bool hasFrequency() => _frequency != null;

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

  // "water" field.
  String? _water;
  String get water => _water ?? '';
  bool hasWater() => _water != null;

  // "carbon" field.
  String? _carbon;
  String get carbon => _carbon ?? '';
  bool hasCarbon() => _carbon != null;

  // "goalType" field.
  String? _goalType;
  String get goalType => _goalType ?? '';
  bool hasGoalType() => _goalType != null;

  // "targetOutput" field.
  String? _targetOutput;
  String get targetOutput => _targetOutput ?? '';
  bool hasTargetOutput() => _targetOutput != null;

  // "timeFrame" field.
  String? _timeFrame;
  String get timeFrame => _timeFrame ?? '';
  bool hasTimeFrame() => _timeFrame != null;

  // "progress" field.
  int? _progress;
  int get progress => _progress ?? 0;
  bool hasProgress() => _progress != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  void _initializeFields() {
    _frequency = snapshotData['frequency'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _created = snapshotData['created'] as DateTime?;
    _water = snapshotData['water'] as String?;
    _carbon = snapshotData['carbon'] as String?;
    _goalType = snapshotData['goalType'] as String?;
    _targetOutput = snapshotData['targetOutput'] as String?;
    _timeFrame = snapshotData['timeFrame'] as String?;
    _progress = castToType<int>(snapshotData['progress']);
    _deleted = snapshotData['deleted'] as bool?;
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
  String? frequency,
  DateTime? date,
  DocumentReference? user,
  DateTime? created,
  String? water,
  String? carbon,
  String? goalType,
  String? targetOutput,
  String? timeFrame,
  int? progress,
  bool? deleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'frequency': frequency,
      'date': date,
      'user': user,
      'created': created,
      'water': water,
      'carbon': carbon,
      'goalType': goalType,
      'targetOutput': targetOutput,
      'timeFrame': timeFrame,
      'progress': progress,
      'deleted': deleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class GoalsRecordDocumentEquality implements Equality<GoalsRecord> {
  const GoalsRecordDocumentEquality();

  @override
  bool equals(GoalsRecord? e1, GoalsRecord? e2) {
    return e1?.frequency == e2?.frequency &&
        e1?.date == e2?.date &&
        e1?.user == e2?.user &&
        e1?.created == e2?.created &&
        e1?.water == e2?.water &&
        e1?.carbon == e2?.carbon &&
        e1?.goalType == e2?.goalType &&
        e1?.targetOutput == e2?.targetOutput &&
        e1?.timeFrame == e2?.timeFrame &&
        e1?.progress == e2?.progress &&
        e1?.deleted == e2?.deleted;
  }

  @override
  int hash(GoalsRecord? e) => const ListEquality().hash([
        e?.frequency,
        e?.date,
        e?.user,
        e?.created,
        e?.water,
        e?.carbon,
        e?.goalType,
        e?.targetOutput,
        e?.timeFrame,
        e?.progress,
        e?.deleted
      ]);

  @override
  bool isValidKey(Object? o) => o is GoalsRecord;
}
