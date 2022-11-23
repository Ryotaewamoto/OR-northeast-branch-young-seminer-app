import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/logger.dart';
import '../models/presentation.dart';
import '../utils/firestore_refs.dart';

final presentationRepositoryProvider =
    Provider.autoDispose((_) => PresentationRepository());

class PresentationRepository {
  Future<List<Presentation>?> fetchPresentations() async {
    final qs = await presentationsRef().get();
    if (qs.docs.isEmpty) {
      logger.warning('Collection not found');
      return null;
    }
    return qs.docs.map((qds) => qds.data()).toList();
  }

  Future<Presentation?> fetchPresentation({
    required String presentationId,
  }) async {
    final ds = await presentationRef(presentationId: presentationId).get();
    if (!ds.exists) {
      logger.warning('Document not found: ${ds.reference.path}');
      return null;
    }
    return ds.data()!;
  }

  Stream<List<Presentation>> subscribePresentations() {
    final collectionStream = presentationsRef().snapshots();
    return collectionStream.map(
      (qs) => qs.docs.map((qds) => qds.data()).toList(),
    );
  }

  /// 指定したユーザー かつ TodoFilter の条件で絞り込んだ Todo 一覧を購読する。
  // Stream<List<Todo>> subscribeTodos({
  //   required String userId,
  //   required TodoFilter todoFilter,
  // }) {
  //   final collectionStream =
  //       todoFilter.queryBuilder(todosRef(userId: userId)).snapshots();
  //   return collectionStream.map(
  //     (qs) => qs.docs.map((qds) => qds.data()).toList(),
  //   );
  // }
}
