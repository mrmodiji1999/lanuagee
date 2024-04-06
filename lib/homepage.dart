import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lanuage/bloc/language_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (context, state) {
            // print(state.curentvalue);
            return Text('bhasha');
          },
        ),
        actions: [
          PopupMenuButton(
              onSelected: (Value) {
                print(Value);
                context
                    .read<LanguageBloc>()
                    .add(LanguageChange(language: Value));
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      child: Text('English'),
                      value: 1,
                    ),
                    const PopupMenuItem(
                      child: Text('Spanish'),
                      value: 2,
                    ),
                  ])
        ],
      ),
      body: BlocConsumer<LanguageBloc, LanguageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView(
              children: [Text(AppLocalizations.of(context)!.helloWorld)]);
        },
      ),
    );
  }
}
