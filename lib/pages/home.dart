import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const path = '/home';
  static const name = 'HomePage';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          IconButton(
            onPressed: () {
              GoRouter.of(context)
                  .push('/home/name-edit');
            },
            icon: const FaIcon(FontAwesomeIcons.gear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: const [
                  Text(
                    '東北ORセミナー2022 \n若手研究交流会',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              const Text(
                '''
「東北ＯＲセミナー 若手研究交流会」は，東北地方を中心とした若手研究者の育成とオペレーションズ・リサーチに関する研究活動・交流の活発化を図るための研究発表会です．毎年、主として学生に研究発表と人的交流の場を提供します．個々の大学や研究室を超えた地域全体での若手研究者育成，および研究者同士の共同研究も視野に入れて東北地方の包括的な研究活性化を目的としています．

尚，新型コロナウイルス感染症対策のため，今年度もオンライン開催とします．また，日程も1日となります．
      ''',
                softWrap: true,
              ),
              const Gap(16),
              Row(
                children: const [
                  Text(
                    '日程',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              const Text(
                '''
      2022年（令和４年）11月27日（日）
      ''',
                softWrap: true,
              ),
              const Gap(16),
              Row(
                children: const [
                  Text(
                    '会場',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              const Text(
                '''
      オンライン（Zoom）
      ''',
                softWrap: true,
              ),
              const Gap(16),
              Row(
                children: const [
                  Text(
                    '参加費',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Gap(8),
              const Text(
                '''
「東北ＯＲセミナー；若手研究交流会」は、日本オペレーションズ・リサーチ学会 東北支部事業として開催され、参加費は無料です。
      ''',
                softWrap: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
