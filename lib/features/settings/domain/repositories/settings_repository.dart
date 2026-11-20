abstract class SettingsRepository {
  Future<void> saveThemeMode(bool isDark);
  bool getThemeMode();
  Future<void> saveLanguage(String lang);
  String getLanguage();
}