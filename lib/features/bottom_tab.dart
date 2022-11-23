import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../pages/home.dart';

import '../pages/presentation_list.dart';

/// 現在選択状態になっている下タブを管理する StateProvider。
final bottomTabStateProvider = StateProvider<BottomTab>((_) => bottomTabs[0]);

/// BottomTab の種別。
enum BottomTabEnum {
  home(label: 'ホーム', location: HomePage.location),
  presentationList(label: '発表一覧', location: PresentationListPage.location);

  const BottomTabEnum({
    required this.label,
    required this.location,
  });

  final String label;
  final String location;
}

/// MainPage の BottomNavigationBar の内容
class BottomTab {
  const BottomTab._({
    required this.index,
    required this.key,
    required this.bottomTabEnum,
  });

  final int index;
  final GlobalKey<NavigatorState> key;
  final BottomTabEnum bottomTabEnum;
}

/// BottomNavigationBarItem.icon に表示するウィジェットを提供するプロバイダ。
final bottomTabIconProvider =
    Provider.family<Widget, BottomTabEnum>((ref, bottomTabEnum) {
  switch (bottomTabEnum) {
    case BottomTabEnum.home:
      return const FaIcon(FontAwesomeIcons.house);
    case BottomTabEnum.presentationList:
      return const FaIcon(FontAwesomeIcons.list);
  }
});

/// MainPage に表示する BottomNavigationBarItem 一覧。
final bottomTabs = <BottomTab>[
  BottomTab._(
    index: 0,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.home,
  ),
  BottomTab._(
    index: 1,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.presentationList,
  ),
];

/// BottomNavigationBarItem をタップしたときの処理を提供する Provider。
///
/// 現在表示している状態のタブをタップした場合は画面をすべて pop する。
final bottomNavigationBarItemOnTapProvider =
    Provider.family<void Function(int), BuildContext>(
  (ref, context) => (index) {
    FocusManager.instance.primaryFocus?.unfocus();
    final bottomTab = bottomTabs[index];
    ref.read(bottomTabStateProvider.notifier).update((state) => bottomTab);
    GoRouter.of(context).go(bottomTab.bottomTabEnum.location);
  },
);
