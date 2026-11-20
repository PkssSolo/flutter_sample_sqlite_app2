import '../../domain/repositories/settings_repository.dart';
import '../../../../core/services/storage_service.dart';

// المستودع لا يتعامل مع GetStorage مباشرة إلا عبر StorageService المحقونة
class SettingsRepositoryImpl implements SettingsRepository {
  final StorageService _storageService;

  SettingsRepositoryImpl(this._storageService);

  @override
  Future<void> saveThemeMode(bool isDark) async {
    _storageService.saveTheme(isDark);
  }

  @override
  bool getThemeMode() {
    return _storageService.isDarkMode.value;
  }

  @override
  Future<void> saveLanguage(String lang) async {
    _storageService.saveLang(lang);
  }

  @override
  String getLanguage() {
    return _storageService.currentLang.value;
  }
}