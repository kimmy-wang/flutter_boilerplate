import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/l10n/l10n.dart';
import 'package:flutter_boilerplate/modules/app/cubit/app_cubit.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MineView();
  }
}

class MineView extends StatelessWidget {
  const MineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 20)),
            Text(
              context.l10n.title,
              style: const TextStyle(fontSize: 20),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            IconButton(
              onPressed: () async {
                await showTranslateActionSheet(context);
              },
              icon: const Icon(Icons.translate),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showTranslateActionSheet(BuildContext context) async {
    final result = await showModalActionSheet<String>(
      context: context,
      title: context.l10n.languages,
      actions: [
        SheetAction(
          icon: Icons.info,
          label: context.l10n.languagesZh,
          key: 'zh',
        ),
        SheetAction(
          icon: Icons.warning,
          label: context.l10n.languagesEn,
          key: 'en',
        ),
      ],
    );
    if (result != null) {
      BlocProvider.of<AppCubit>(context).setLocale(Locale(result));
    }
  }
}
