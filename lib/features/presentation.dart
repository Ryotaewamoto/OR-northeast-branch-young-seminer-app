import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/repositories/presentation_repository.dart';

/// Presentation 一覧を取得する FutureProvider
final presentationsFutureProvider = FutureProvider.autoDispose((ref) {
  return ref.read(presentationRepositoryProvider).fetchPresentations();
});

final presentationsStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.read(presentationRepositoryProvider).subscribePresentations();
});
