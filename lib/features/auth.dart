import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/repositories/app_user_repository.dart';

import '../models/app_user.dart';
import '../utils/exceptions/base.dart';
import '../utils/firestore_refs.dart';
import '../utils/loading.dart';
import '../utils/logger.dart';

final authProvider = Provider<FirebaseAuth>((_) => FirebaseAuth.instance);

final authUserProvider = StreamProvider<User?>(
  (ref) => ref.watch(authProvider).userChanges(),
);

final userIdProvider = Provider<AsyncValue<String?>>(
  (ref) => ref.watch(authUserProvider).whenData((user) => user?.uid),
);

final isSignedInProvider = Provider(
  (ref) => ref.watch(userIdProvider).whenData((userId) => userId != null),
);

/// 特定の AppUser を購読する StreamProvider
final appUserStreamProvider = StreamProvider.family
    .autoDispose<AppUser?, String>((ref, userId) {
  return ref
      .read(appUserRepositoryProvider)
      .subscribeAppUser(userId: userId);
});

/// FirebaseAuth の匿名ログインを行って、そのユーザー ID でユーザードキュメントを作成する。
final signInAnonymouslyProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      ref.read(overlayLoadingProvider.notifier).update((state) => true);
      final userCredential = await ref.watch(authProvider).signInAnonymously();
      final user = userCredential.user;
      if (user == null) {
        throw const AppException(message: '匿名サインインに失敗しました。');
      }
      ref.read(appUserRepositoryProvider).setUser(userId: user.uid);
    } on FirebaseException catch (e) {
      logger.warning(e.toString());
    } on AppException catch (e) {
      logger.warning(e.toString());
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// FirebaseAuth からログアウトする。
final signOutProvider = Provider.autoDispose<Future<void> Function()>(
  (ref) => () async {
    try {
      ref.read(overlayLoadingProvider.notifier).update((state) => true);
      await ref.watch(authProvider).signOut();
    } finally {
      ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  },
);

/// Comment を入力・作成する機能をグループ化して提供する StateNotifierProvider。
final appUserNameStateNotifierProvider =
    StateNotifierProvider.autoDispose<AppUserNameStateNotifier, AppUser>(
  AppUserNameStateNotifier.new,
);

class AppUserNameStateNotifier extends StateNotifier<AppUser> {
  AppUserNameStateNotifier(this._ref) : super(const AppUser());

  final AutoDisposeStateNotifierProviderRef<AppUserNameStateNotifier, AppUser> _ref;

  final TextEditingController userNameController = TextEditingController();
  String get userName => userNameController.value.text;

  /// 入力した AppUser を作成する。
  Future<void> submit() async {
    try {
      final userId = _ref.read(userIdProvider).value;
      if (userId == null) {
        throw const AppException(message: 'この操作を行うにはサインインが必要です。');
      }
      _ref.read(overlayLoadingProvider.notifier).update((state) => true);
      final appUser = AppUser(
        userId: userId,
        userName: userName,
      );
      await appUserRef(userId: userId).set(appUser);
    } on Exception {
      rethrow;
    } finally {
      _ref.read(overlayLoadingProvider.notifier).update((state) => false);
    }
  }
}
