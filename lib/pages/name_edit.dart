import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:or_northeast_branch_young_seminer_app/features/auth.dart';

import '../utils/scaffold_messenger_service.dart';

class NameEditPage extends HookConsumerWidget {
  const NameEditPage({super.key});

  static const path = '/home/name-edit';
  static const name = 'NameEditPage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('名前を編集'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            UserNameTextField(),
            Gap(8),
            UserNameEditButton(),
          ],
        ),
      ),
    );
  }
}

/// userName を入力する TextField。
class UserNameTextField extends HookConsumerWidget {
  const UserNameTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: ref
          .watch(appUserNameStateNotifierProvider.notifier)
          .userNameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.done,
      cursorWidth: 1,
      minLines: 2,
      maxLines: 2,
      maxLength: 20,
      decoration: const InputDecoration(
        hintText: '名前を入力（空の場合、”匿名”になります。）',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.all(12),
        isDense: true,
        filled: false,
      ),
    );
  }
}

/// userName を編集するボタン。
class UserNameEditButton extends HookConsumerWidget {
  const UserNameEditButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.pop(context);
        try {
          final showSnackBar = ScaffoldMessenger.of(context);
          await ref.read(appUserNameStateNotifierProvider.notifier).submit();
          showSnackBar.showSnackBar(
            const SnackBar(
              content: Text('ユーザ名を変更しました。'),
              duration: Duration(seconds: 2),
            ),
          );
        } on Exception catch (e) {
          ref.read(scaffoldMessengerServiceProvider).showSnackBarByException(e);
        }
      },
      child: const Text('変更'),
    );
  }
}
