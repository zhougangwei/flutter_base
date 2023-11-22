import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../language/current_locale.dart';
class ChangeLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final localizations = S.of(context);
    final languageProvider = Provider.of<CurrentLocale>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.blog),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localizations.blog),
            ElevatedButton(
              onPressed: () {
                languageProvider.setLocale(Locale('it'));
              },
              child: Text('切换到意大利'),
            ),
            ElevatedButton(
              onPressed: () {
                languageProvider.setLocale(Locale('en'));
              },
              child: Text('切换到英语'),
            ),
          ],
        ),
      ),
    );
  }
}