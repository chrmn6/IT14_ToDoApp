import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/app_style.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/provider/radio_provider.dart';
import 'package:todo_app/utils/radio_widget.dart';

class CategoryFolder extends ConsumerWidget {
  const CategoryFolder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category", style: AppStyle.headingOne),
        const Gap(8),
        Row(
          children: [
            Expanded(
              child: RadioWidget(
                titleRadio: 'WORK',
                categColor: Colors.blue,
                valueInput: 1,
                onChangedValue:
                    () => ref.read(radioProvider.notifier).update((state) => 1),
              ),
            ),
            Expanded(
              child: RadioWidget(
                titleRadio: 'PRSN',
                categColor: Colors.green,
                valueInput: 2,
                onChangedValue:
                    () => ref.read(radioProvider.notifier).update((state) => 2),
              ),
            ),
            Expanded(
              child: RadioWidget(
                titleRadio: 'ACADS',
                categColor: Colors.red,
                valueInput: 3,
                onChangedValue:
                    () => ref.read(radioProvider.notifier).update((state) => 3),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
