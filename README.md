## 📚 App tracking events library

App tracking events is a Flutter library that offers a unified interface for logging events and errors, allowing integration with multiple service providers, such as Firebase. The library defines clear interfaces that ensure consistency and ease of use. With SearsLogger, developers can log custom events, application opens, authentications, and network errors, simplifying the application monitoring and analysis process.

#### ➡️ Installation
-  To install the package, add it to your pubspec.yaml:
    - Local
        ```
        dependencies:
          sears_logger:
            git:
              url: https://github.com/yourusername/sears_logger.git
        ```
    - Remote
        ```
        dependencies:
          sears_logger:
            path: ../projectPath
        ```

### ➡ Getting Started
- #### Importing the Package
   - To use the package, import it into your Dart file:
        ```
        import 'package:sears_logger/sears_logger.dart';
        ```

- #### Creating an Instance
    - You can create an instance of ISearsLogger using any available provider. Below is an example using Firebase:
    
        ```
        final ISearsLogger logger = FirebaseMethod(
            firebaseOptions: FirebaseOptions(firebaseOptions: ...),
        );
        ```
    - Alternatively, you can use a dependency manager like Get It:
    
        ```
        import 'package:get_it/get_it.dart';

        final getIt = GetIt.instance;
        
        void setup() {
          getIt.registerLazySingleton<ISearsLogger>(
            () => FirebaseMethod(firebaseOptions: ...),
          );
        }
        ```
### ➡ Usage
- #### **Analytics**
   - The ISearsAnalytics interface provides methods to log various types of events:
   
        ```
        // Log a custom event
        await instance.analytics.logEvent(
          name: 'custom_event',
          parameters: {'param1': 'value1', 'param2': 'value2'},
        );
        
        // Log app open event
        await instance.analytics.logAppOpen(parameters: {'source': 'notification'});
        
        // Log sign-in event
        await instance.analytics.logSignin(
          loginMethod: 'email',
          parameters: {'user_id': 'user123'},
        );
        
        // Log sign-up event
        await instance.analytics.logSignUp(
          signUpMethod: 'email',
          parameters: {'user_id': 'user123'},
        );
        
        // Log sign-out event
        await instance.analytics.logSignout(parameters: {'user_id': 'user123'});
        
        // Reset all device data
        await instance.analytics.resetAllDeviceData();
        ```

- #### **Crashlytics**
   - The ISearsCrashlytics interface provides methods to record errors:

        ```
        // Record a generic error
        try {
          // Your code that might throw an error
        } catch (error) {
          await logger.crashlytics.recordError(
            error: error,
            stackTrace: error.stackTrace,
            reason: 'A specific reason',
            information: [{info1: 'content'}, {info2: 'content'}],
            isFatal: false,
          );
        }
        
        // Record a network error
        await logger.crashlytics.recordNetworkError(
          error: Exception('Network error'),
          url: 'https://api.example.com/data',
          httpMethod: 'GET',
          startTime: startTime,
          endTime: endTime,
          stackTrace: stackTrace,
          response: {'status': '500', 'body': 'Internal Server Error'},
          isFatal: false,
        );
        ```
        
### ➡ Available Providers
- #### **Firebase**
   - The FirebaseMethod provider integrates Firebase for analytics and crash reporting.
   - Para usar este método, só sera necessario informar as credencias do seu projeto atraves da classe [_FirebaseOptions_]( https://firebase.google.com/docs/reference/kotlin/com/google/firebase/FirebaseOptions) 🔗
       ```
        FirebaseMethod(
          firebaseOptions: FirebaseOptions(
            apiKey: 'your-api-key',
            authDomain: 'your-auth-domain',
            projectId: 'your-project-id',
            storageBucket: 'your-storage-bucket',
            messagingSenderId: 'your-messaging-sender-id',
            appId: 'your-app-id',
          )
        }
        ```