import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

// import UIKit
// import Flutter
// import AuthenticationServices

// @UIApplicationMain
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     GeneratedPluginRegistrant.register(with: self)

//     if #available(iOS 13.0, *) {
//       // Ensures Apple Sign-In works
//       ASAuthorizationAppleIDProvider().getCredentialState(forUserID: "yourUserId") { (credentialState, error) in
//         switch credentialState {
//         case .authorized:
//           break // The Apple ID credential is valid.
//         case .revoked, .notFound:
//           break // The Apple ID credential is either revoked or was not found, so show the sign-in UI.
//         default:
//           break
//         }
//       }
//     }
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }
