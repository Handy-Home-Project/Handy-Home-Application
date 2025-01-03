import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:handy_home/commons/theme/colors.dart';
import 'package:handy_home/presentation/components/button/handy_home_button1.dart';
import 'package:handy_home/presentation/providers/onboarding_provider.dart';

import '../../components/text_editing_box/handy_home_text_editing_box.dart';

class OnboardingNameInputScreen extends ConsumerWidget {
  const OnboardingNameInputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '핸디홈을 사용하려면\n',
                  style: Theme.of(context).textTheme.titleLarge
                ),
                TextSpan(
                  text: '사용자 이름',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: kBlue1),
                ),
                TextSpan(
                  text: '이 필요해요',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ]
            ),
          ),
          const SizedBox(height: 60),
          HandyHomeTextEditingBox(
            controller: ref.read(onboardingProvider).nameController,
            onChanged: (text) {
              ref.read(onboardingProvider).nameController.text = text;
            },
            hint: '이름을 입력해주세요',
          ),
          const Spacer(),
          HandyHomeButton1(
            text: '다음',
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(onboardingProvider.notifier).createUser();
            },
          ),
        ],
      ),
    );
  }
}
