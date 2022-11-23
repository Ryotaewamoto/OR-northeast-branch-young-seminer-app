import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:or_northeast_branch_young_seminer_app/models/comment.dart';
import 'package:or_northeast_branch_young_seminer_app/models/presentation.dart';

import '../models/app_user.dart';

final db = FirebaseFirestore.instance;

/// appUsers コレクションの参照。
final _appUsersRef = db.collection('appUsers').withConverter(
      fromFirestore: (ds, _) => AppUser.fromDocumentSnapshot(ds),
      toFirestore: (obj, _) => obj.toJson(),
    );

CollectionReference<AppUser> appUsersRef() => _appUsersRef;

/// appUser ドキュメントの参照。
DocumentReference<AppUser> appUserRef({
  required String userId,
}) =>
    _appUsersRef.doc(userId);

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


/// todo コレクションの参照。
CollectionReference<Comment> commentsRef({
  required String userId,
}) =>
    appUserRef(userId: userId).collection('comments').withConverter(
          fromFirestore: (ds, _) => Comment.fromDocumentSnapshot(ds),
          toFirestore: (obj, _) => obj.toJson(),
        );

/// todo ドキュメントの参照。
DocumentReference<Comment> commentRef({
  required String userId,
  required String todoId,
}) =>
    commentsRef(userId: userId).doc(todoId);
