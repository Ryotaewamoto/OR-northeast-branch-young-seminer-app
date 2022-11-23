import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      body: Column(
        children: [],
      ),
    );
  }
}
