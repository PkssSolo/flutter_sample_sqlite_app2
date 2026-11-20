import 'package:ejari/core/locale/app_translations.dart';
import 'package:ejari/core/theme/app_theme.dart';
import 'package:ejari/core/utils/hive_service.dart';
import 'package:ejari/core/utils/locale_service.dart';
import 'package:ejari/core/utils/theme_service.dart';
import 'package:ejari/features/home/data/adapters/contract_model_adapter.dart';
import 'package:ejari/features/home/data/adapters/payment_model_adapter.dart';
import 'package:ejari/features/home/data/adapters/property_model_adapter.dart';
import 'package:ejari/routes/app_pages.dart';
import 'package:ejari/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Locale data for intl date/number formatting (Arabic & English).
  await initializeDateFormatting();

  // Local database: adapters are registered before any box is opened.
  final HiveService hiveService = await Get.putAsync<HiveService>(
    () => HiveService().init(registerAdapters: _registerHiveAdapters),
    permanent: true,
  );

  // App-wide services, restored from the persisted Hive settings.
  Get.put<ThemeService>(ThemeService(hiveService), permanent: true);
  Get.put<LocaleService>(LocaleService(hiveService), permanent: true);

  runApp(const EjariApp());
}

void _registerHiveAdapters() {
  if (!Hive.isAdapterRegistered(PropertyModelAdapter.hiveTypeId)) {
    Hive.registerAdapter(PropertyModelAdapter());
  }
  if (!Hive.isAdapterRegistered(ContractModelAdapter.hiveTypeId)) {
    Hive.registerAdapter(ContractModelAdapter());
  }
  if (!Hive.isAdapterRegistered(PaymentModelAdapter.hiveTypeId)) {
    Hive.registerAdapter(PaymentModelAdapter());
  }
}

/// Root widget of Ejari.
///
/// Text direction (RTL for Arabic, LTR for English) is derived from [locale]
/// by the `GlobalWidgetsLocalizations` delegate, so `Get.updateLocale` in
/// `LocaleService` flips the whole UI direction automatically.
class EjariApp extends StatelessWidget {
  const EjariApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeService themeService = Get.find<ThemeService>();
    final LocaleService localeService = Get.find<LocaleService>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (_) => 'app_name'.tr,

      // Localization
      translations: AppTranslations(),
      locale: localeService.locale,
      fallbackLocale: LocaleService.fallbackLocale,
      supportedLocales: LocaleService.supportedLocales,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeService.themeMode,

      // Routing
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
      defaultTransition: Transition.fadeIn,
    );
  }
}
