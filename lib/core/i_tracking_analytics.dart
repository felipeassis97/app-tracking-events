abstract class ITrackingAnalytics {
  /// Record when the user removes or cleans the application
  Future<void> resetAllDeviceData();

  /// Register an event as soon as the app starts
  Future<void> logAppOpen(
    Map<String, Object>? parameters,
  );

  /// Register a custom event
  Future<void> logEvent({
    required String name,
    Map<String, Object>? parameters,
  });

  /// Record when the user leaves the application
  Future<void> logSignOut({
    Map<String, Object>? parameters,
  });

  /// Record when the user enters the application
  Future<void> logSignIn({
    required String loginMethod,
    Map<String, Object>? parameters,
  });

  /// Record when the user registers on the application
  Future<void> logSignUp({
    required String signUpMethod,
    Map<String, Object>? parameters,
  });
}
