import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/exceptions/base.dart';
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
      body: Column(
        children: [Text(presentationId)],
      ),
    );
  }
}
