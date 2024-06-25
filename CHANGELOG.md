## Release 1.0.0

1. Provides a unified interface for logging analytics and crash reports.
2. Includes interfaces for ITrackingEvents, ITrackingAnalytics, and ITrackingCrashlytics.
3. Added Firebase provider (FirebaseMethod) for analytics and crash reporting.
4. Supports logging custom events, app opens, sign-ins, sign-outs, and sign-ups.
5. Allows recording of generic and network errors.
6. Documentation and example usage included.

## Release 1.0.1

1. Modify credential input data. You should not use any class that belongs to a third-party library to input data into our available methods. With this, the dependency on a _FirebaseOptions_ input was removed and another class called _FirebaseCredentials_ that belongs to our library should be used.
