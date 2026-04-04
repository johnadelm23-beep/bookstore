import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTranslationButton extends StatelessWidget {
  const CustomTranslationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (context.locale.languageCode == "ar") {
          context.setLocale(Locale("en"));
        } else {
          context.setLocale(Locale("ar"));
        }
      },
      icon: Icon(Icons.language),
    );
  }
}
