import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:one_second_diary/bindings/initial_binding.dart';
import 'package:one_second_diary/utils/theme.dart';
import 'lang/translation_service.dart';
import 'routes/app_pages.dart';
import 'utils/shared_preferences_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // builder: DevicePreview.appBuilder,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
      initialRoute: StorageUtil.getBool('showIntro') == false
          ? Routes.HOME
          : Routes.INTRO,
      debugShowCheckedModeBanner: false,
      title: 'One Second Diary',
      themeMode: ThemeService().theme,
      theme: Themes.light,
      darkTheme: Themes.dark,
    );
  }
}
