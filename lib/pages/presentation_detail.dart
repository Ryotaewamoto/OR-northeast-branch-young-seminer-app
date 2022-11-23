import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/features/presentation.dart';

import '../features/comment.dart';
import '../utils/exceptions/base.dart';
import '../utils/loading.dart';
import '../utils/routing/app_routes.dart';
import '../utils/scaffold_messenger_service.dart';
import '../widgets/dialog.dart';

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
      floatingActionButton: FloatingActionButton(
        child: const FaIcon(FontAwesomeIcons.message),
        onPressed: () async {
          await showDialog<void>(
            context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: const Text('コメント'),
                  content: CommonAlertDialogContent(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const TodoDescriptionTextField(),
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text(
                                'キャンセル',
                              ),
                            ),
                            const SubmitButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
        },
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '発表者',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '${presentation.presenterName}(${presentation.belong})',
                            ),
                          ),
                          const Gap(8),
                          const Text(
                            'タイトル',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(presentation.title),
                          ),
                          const Gap(8),
                          const Text(
                            'アブストラクト',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(presentation.description),
                          ),
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

/// Todo の説明を入力する TextField。
class TodoDescriptionTextField extends HookConsumerWidget {
  const TodoDescriptionTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref
          .watch(commentFormStateNotifierProvider.notifier)
          .descriptionController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
      cursorWidth: 1,
      minLines: 3,
      maxLines: 5,
      decoration: const InputDecoration(
        hintText: '説明を入力（任意）',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(12),
        isDense: true,
        filled: false,
      ),
    );
  }
}

/// Todo を作成するボタン。
class SubmitButton extends HookConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pop(context);
        try {
          await ref.read(commentFormStateNotifierProvider.notifier).submit();
          ref.read(scaffoldMessengerServiceProvider).showSnackBar('コメントしました。');
        } on Exception catch (e) {
          ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
        }
      },
      child: const Text('作成する'),
    );
  }
}
