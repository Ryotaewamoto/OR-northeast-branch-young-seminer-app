import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/comment.dart';
import '../utils/exceptions/base.dart';
import '../utils/firestore_refs.dart';
import '../utils/loading.dart';
import '../utils/uuid.dart';
import 'auth.dart';

/// Comment を入力・作成する機能をグループ化して提供する StateNotifierProvider。
final commentFormStateNotifierProvider =
    StateNotifierProvider.autoDispose<CommentFormStateNotifier, Comment>(
  CommentFormStateNotifier.new,
);

class CommentFormStateNotifier extends StateNotifier<Comment> {
  CommentFormStateNotifier(this._ref) : super(const Comment());

  final AutoDisposeStateNotifierProviderRef<CommentFormStateNotifier, Comment> _ref;

  final TextEditingController descriptionController = TextEditingController();
  String get description => descriptionController.value.text;

  /// 入力した Comment を作成する。
  Future<void> submit() async {
    try {
      _validate();
      final userId = _ref.read(userIdProvider).value;
      if (userId == null) {
        // 匿名サインインを行なっているのでこエラーは基本的には起こり得ない。
        throw const AppException(message: 'この操作を行うにはサインインが必要です。');
      }
      _ref.read(overlayLoadingProvider.notifier).update((state) => true);
      final comment = Comment(
        commentId: uuid,
        userId: userId,
        description: description,
      );
      await commentRef(userId: userId, todoId: comment.commentId).set(comment);
    } on Exception {
      rethrow;
    } finally {
      _ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  }

  /// フォーム送信前のバリデーションを行う。
  /// 問題があればその理由と一緒に例外をスローする。問題がなければ何もしない。
  void _validate() {
    if (description.isEmpty) {
      throw const AppException(message: 'コメントを入力してください。');
    }
  }
}
