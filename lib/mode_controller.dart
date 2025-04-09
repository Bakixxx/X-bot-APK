enum AppMode {
  demo,
  real,
}

class ModeController {
  static AppMode _currentMode = AppMode.demo;

  static AppMode get currentMode => _currentMode;

  static void setMode(AppMode mode) {
    _currentMode = mode;
  }

  static bool get isDemo => _currentMode == AppMode.demo;
}
