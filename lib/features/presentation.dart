import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/repositories/presentation_repository.dart';

import '../models/presentation.dart';

/// Presentation 一覧を取得する FutureProvider
final presentationsFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(presentationRepositoryProvider).fetchPresentations();
});

/// Presentation 一覧を購読する StreamProvider
final presentationsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.read(presentationRepositoryProvider).subscribePresentations();
});

/// 特定の Presentation を購読する StreamProvider
final presentationStreamProvider = StreamProvider.family.autoDispose<Presentation?, String>((ref, presentationId) {
  return ref
      .read(presentationRepositoryProvider)
      .subscribePresentation(presentationId: presentationId);
});
