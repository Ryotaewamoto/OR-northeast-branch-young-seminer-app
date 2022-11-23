import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/features/presentation.dart';

import '../utils/exceptions/base.dart';
import '../utils/loading.dart';
import '../utils/routing/app_routes.dart';

/// presentationId を取得してから返す Provider。
final presentationIdProvider = Provider.autoDispose<String>(
  (ref) {
    try {
      final state = ref.read(goRouterStateProvider);
      final presentationId = state.params['presentationId']!;
      return presentationId;
    } on Exception {
      throw const AppException(message: '発表が見つかりませんでした。');
    }
  },
  dependencies: <Provider>[
    goRouterStateProvider,
  ],
);

class PresentationDetailPage extends HookConsumerWidget {
  const PresentationDetailPage({super.key});

  static const path = '/presentation-list/:presentationId';
  static const name = 'PresentationDetailPage';
  static String location({required String presentationId}) =>
      '/presentation-list/$presentationId';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentationId = ref.watch(presentationIdProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('発表詳細'),
      ),
      body: PresentationDetail(
        presentationId: presentationId,
      ),
    );
  }
}

class PresentationDetail extends HookConsumerWidget {
  const PresentationDetail({
    required this.presentationId,
    super.key,
  });

  final String presentationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presentationProvider =
        ref.watch(presentationStreamProvider(presentationId)).when<Widget>(
              data: (presentation) => presentation != null
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(presentation.presenterName),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("データがありません。"),
                    ),
              error: (error, stackTrace) => const Center(
                child: Text("エラーが発生しました。"),
              ),
              loading: () => const OverlayLoadingWidget(),
            );

    return presentationProvider;
  }
}
