abstract class ITrackingCrashlytics {
  /// 🔸 __Records generic failures__
  /// - You can register fatal or non-fatal exceptions using the recordError method with custom attributes.
  Future<void> recordError({
    required Object error,
    StackTrace? stackTrace,
    String? reason,
    Iterable<Object> information = const [],
    bool isFatal = false,
  });

  /// 🔸 __Records network failures__
  /// - If a network request fails, use this method to record details about the failures.
  /// - An option to also send a response body.
  Future<void> recordNetworkError({
    required Object error,
    required String url,
    required String httpMethod,
    required int startTime,
    required int endTime,
    required StackTrace stackTrace,
    Map<String, dynamic>? response,
    bool isFatal = false,
  });
}
