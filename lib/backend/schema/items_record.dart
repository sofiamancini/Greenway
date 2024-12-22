import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "item_name" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  bool hasItemName() => _itemName != null;

  // "scanned_time" field.
  DateTime? _scannedTime;
  DateTime? get scannedTime => _scannedTime;
  bool hasScannedTime() => _scannedTime != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "deleted" field.
  bool? _deleted;
  bool get deleted => _deleted ?? false;
  bool hasDeleted() => _deleted != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "nova" field.
  String? _nova;
  String get nova => _nova ?? '';
  bool hasNova() => _nova != null;

  // "nutrition" field.
  String? _nutrition;
  String get nutrition => _nutrition ?? '';
  bool hasNutrition() => _nutrition != null;

  // "eco_score" field.
  String? _ecoScore;
  String get ecoScore => _ecoScore ?? '';
  bool hasEcoScore() => _ecoScore != null;

  void _initializeFields() {
    _itemName = snapshotData['item_name'] as String?;
    _scannedTime = snapshotData['scanned_time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _deleted = snapshotData['deleted'] as bool?;
    _image = snapshotData['image'] as String?;
    _nova = snapshotData['nova'] as String?;
    _nutrition = snapshotData['nutrition'] as String?;
    _ecoScore = snapshotData['eco_score'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('items');

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? itemName,
  DateTime? scannedTime,
  DocumentReference? user,
  bool? deleted,
  String? image,
  String? nova,
  String? nutrition,
  String? ecoScore,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'item_name': itemName,
      'scanned_time': scannedTime,
      'user': user,
      'deleted': deleted,
      'image': image,
      'nova': nova,
      'nutrition': nutrition,
      'eco_score': ecoScore,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.itemName == e2?.itemName &&
        e1?.scannedTime == e2?.scannedTime &&
        e1?.user == e2?.user &&
        e1?.deleted == e2?.deleted &&
        e1?.image == e2?.image &&
        e1?.nova == e2?.nova &&
        e1?.nutrition == e2?.nutrition &&
        e1?.ecoScore == e2?.ecoScore;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.itemName,
        e?.scannedTime,
        e?.user,
        e?.deleted,
        e?.image,
        e?.nova,
        e?.nutrition,
        e?.ecoScore
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
