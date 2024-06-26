abstract class ITrackingAnalytics {
  /// 🔹 Record when the user removes or cleans the application
  Future<void> resetAllDeviceData();

  /// 🔹 Register an event as soon as the app starts and additional [parameters] (optional)
  Future<void> logAppOpen(
    Map<String, Object>? parameters,
  );

  /// 🔹 Register a custom event with [name] and additional [parameters] (optional)
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  });

  /// 🔹 Record when the user leaves the application and additional [parameters] (optional)
  Future<void> logSignOut({
    Map<String, Object>? parameters,
  });

  /// 🔹 Record when the user enters the application with the [loginMethod] and additional [parameters] (optional)
  Future<void> logSignIn({
    required String loginMethod,
    Map<String, Object>? parameters,
  });

  /// 🔹 Record when the user registers on the application with the [signUpMethod] and additional [parameters] (optional)
  Future<void> logSignUp({
    required String signUpMethod,
    Map<String, Object>? parameters,
  });
}
