import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taggame/models/serializers.dart';

BuiltList<T> mapFirestoreToModels<T extends Built<dynamic, dynamic>?>(
  QuerySnapshot<T> snapshot,
) {
  return snapshot.docs.map((it) => it.data()).toBuiltList();
}

T? mapFirestoreToModel<T extends Built<dynamic, dynamic>>(
  DocumentSnapshot<Map<String, dynamic>> snapshot,
  SnapshotOptions? options,
) {
  final data = snapshot.data();
  if (data == null) return null;

  try {
    return deserialize<T>(
      data..putIfAbsent('id', () => snapshot.id),
    );
  } on Error catch (e, stackTrace) {
    // CrashlyticsService.instance.onError(e, stackTrace);
    return null;
  }
}

Map<String, dynamic> mapToFirestoreModel<T extends Built<dynamic, dynamic>>(
  T? value,
  SetOptions? options,
) {
  if (value == null) return <String, Object?>{};

  return (serialize(value)?..remove('id')) ?? <String, Object?>{};
}
