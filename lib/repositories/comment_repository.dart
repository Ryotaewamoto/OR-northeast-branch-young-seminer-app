import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/models/comment.dart';

import '../../utils/logger.dart';
import '../utils/firestore_refs.dart';

final commentRepositoryProvider =
    Provider.autoDispose((_) => CommentRepository());

class CommentRepository {
  Future<List<Comment>?> fetchComments({required String presentationId}) async {
    final qs = await commentsRef(presentationId: presentationId).get();
    if (qs.docs.isEmpty) {
      logger.warning('Collection not found');
      return null;
    }
    return qs.docs.map((qds) => qds.data()).toList();
  }

  Stream<List<Comment>> subscribeComments({required String presentationId}) {
    final collectionStream = commentsRef(presentationId: presentationId)
        .orderBy('createdAt', descending: true)
        .snapshots();
    return collectionStream.map(
      (qs) => qs.docs.map((qds) => qds.data()).toList(),
    );
  }
}
