import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:or_northeast_branch_young_seminer_app/models/presentation.dart';

final db = FirebaseFirestore.instance;

/// presentations コレクションの参照(withConverter)。
final _presentationsRef = db.collection('presentations').withConverter(
      fromFirestore: (ds, _) => Presentation.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

/// presentations コレクションの参照。
CollectionReference<Presentation> presentationsRef() => _presentationsRef;

/// presentation ドキュメントの参照。
DocumentReference<Presentation> presentationRef({
  required String presentationId,
}) =>
    _presentationsRef.doc(presentationId);
