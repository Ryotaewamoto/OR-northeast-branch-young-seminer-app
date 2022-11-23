import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PresentationDetailPage extends HookConsumerWidget {
  const PresentationDetailPage({super.key});

  static const path = '/presentation-detail';
  static const name =  'PresentationDetailPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('発表詳細'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
