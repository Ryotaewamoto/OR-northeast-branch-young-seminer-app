import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:or_northeast_branch_young_seminer_app/features/presentation.dart';

import '../utils/loading.dart';

class PresentationListPage extends HookConsumerWidget {
  const PresentationListPage({super.key});

  static const path = '/presentation-list';
  static const name = 'PresentationListPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('発表一覧'),
        ),
        body: const PresentationList());
  }
}

class PresentationList extends HookConsumerWidget {
  const PresentationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DateFormat outputFormat = DateFormat('HH:mm:ss');
    final presentationsProvider = ref
        .watch(presentationsStreamProvider)
        .when<Widget>(
          data: (data) => data.isNotEmpty
              ? ListView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final presentation = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        onTap: () {
                          GoRouter.of(context).push(
                              '/presentation-list/${presentation.presentationId}');
                        },
                        child: Stack(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blueAccent.withOpacity(0.2),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 140,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Flexible(
                                              child: Text(
                                                presentation.title,
                                                softWrap: true,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                            '発表者: ${presentation.presenterName}'),
                                        Text('所属: ${presentation.belong}'),
                                        Text(
                                            '開始時間: ${outputFormat.format(presentation.startAt.dateTime!)}'),
                                        Text(
                                            '終了時間: ${outputFormat.format(presentation.endAt.dateTime!)}'),
                                      ]),
                                ),
                              ),
                            ),
                            presentation.isDone
                                ? Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    margin: const EdgeInsets.all(0),
                                    color: Colors.grey.withOpacity(0.5),
                                    child: const SizedBox(
                                      width: double.infinity,
                                      height: 140,
                                      child: Center(
                                        child: Text(
                                          '発表済み',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("データがありません。"),
                ),
          error: (error, stackTrace) => const Center(
            child: Text("エラーが発生しました。"),
          ),
          loading: () => const OverlayLoadingWidget(),
        );
    return presentationsProvider;
  }
}
