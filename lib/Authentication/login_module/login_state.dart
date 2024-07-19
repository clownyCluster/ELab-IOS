import 'package:dio/dio.dart';
import 'package:elab/global.dart';
import 'package:elab/screen/HomeModule/home_display.dart';
import 'package:elab/screen/splashModule/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../constant/constant.dart';
import '../../main.dart';
import '../../service/local_storage_service.dart';
import '../../service/toast_service.dart';

// class LoginState extends ChangeNotifier {
//   final formKey = GlobalKey<FormState>();
//   Dio dio = Dio();
//   // var token = LocalStorageService().read(LocalStorageKeys.accessToken);
//   String? email;
//   String? password;

//   onEmailChanged(val) {
//     email = val;
//     notifyListeners();
//     // print(email);
//   }

//   onPasswordChanged(val) {
//     password = val;
//     notifyListeners();
//     // print(password);
//   }

//   bool isPasswordVisible = true;

//   onVisibilityChanged() {
//     isPasswordVisible = !isPasswordVisible;
//     notifyListeners();
//   }

//   bool submitLoading = false;
//   setSubmitLoading(val) {
//     submitLoading = val;
//     notifyListeners();
//   }

//   List errors = [];

//   onLogin() async {
//     setSubmitLoading(true);
//     var loginData = {
//       "email": email,
//       "password": password,
//     };
//     print(loginData);
//     try {
//       var response = await dio.post(
//         "$base_url/login",
//         options: Options(
//           headers: {
//             "apikey": "elab-ktmrush-api-v1-2023",
//             'Accept': 'application/json',
//           },
//         ),
//         data: loginData,
//       );

//       ToastService().s(response.data['message']);

//       LocalStorageService()
//           .write(LocalStorageKeys.accessToken, response.data['data']['_token']);

//       print('yo useId ho ${response.data['data']['user']['id']}');

//       // isLoggedIn = true;
//       // print('yo logged in ko report ho $isLoggedIn');
//       print('login vayo');

//       navigatorKey.currentState!.pushNamed(SplashScreen.id);
//       notifyListeners();
//     } on DioException catch (err) {
//       print(err);
//       ToastService().e(err.response!.data['message']);
//       print(err.response!);
//     }
//     setSubmitLoading(false);
//   }

//   String? googleToken;

//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth auth = FirebaseAuth.instance;

//   signInWithGoogle() async {
//     EasyLoading.show();
//     try {
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//       if (googleUser == null) {
//         // The user canceled the sign-in process
//         return;
//       }

//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       googleToken = googleAuth.accessToken;
//       LocalStorageService()
//           .write(LocalStorageKeys.googleToken, googleToken);

//       final UserCredential authResult =
//           await auth.signInWithCredential(credential);
//       final User? user = authResult.user;

//       if (user != null) {
//         // Successful sign-in
//         print('User is signed in: ${user.displayName}');
//         print('Access Token: ${googleAuth.accessToken}');
//         onGoogleLogin();
//       } else {
//         // Handle sign-in failure
//         print('Error signing in with Google: User is null');
//       }
//     } catch (error) {
//       // Handle errors
//       print('Error signing in with Google: $error');
//     }
//     EasyLoading.dismiss();
//   }

//   onGoogleLogin() async {
//     var data = {'access_token': googleToken};
//     print('yo google ko $data');
//     setSubmitLoading(true);
//     try {
//       var response = await dio.post(
//         "$base_url/google/login",
//         options: Options(
//           headers: {
//             "apikey": "elab-ktmrush-api-v1-2023",
//             'Accept': 'application/json',
//           },
//         ),
//         data: data,
//       );

//       ToastService().s(response.data['message']);

//       LocalStorageService()
//           .write(LocalStorageKeys.accessToken, response.data['token']);
//       print('login vayo');

//       navigatorKey.currentState!
//           .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
//       notifyListeners();
//     } on DioException catch (err) {
//       print(err);
//       ToastService().e(err.response!.data['message']);
//       print(err.response!);
//     }
//     setSubmitLoading(false);
//   }

//   appleLogin() async {
//     var data = {'access_token': googleToken};
//     print('yo google ko $data');
//     setSubmitLoading(true);
//     try {
//       var response = await dio.post(
//         "$base_url/apple/login",
//         options: Options(
//           headers: {
//             "apikey": "elab-ktmrush-api-v1-2023",
//             'Accept': 'application/json',
//           },
//         ),
//         data: data,
//       );

//       ToastService().s(response.data['message']);

//       LocalStorageService()
//           .write(LocalStorageKeys.accessToken, response.data['token']);
//       print('login vayo');

//       navigatorKey.currentState!
//           .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
//       notifyListeners();
//     } on DioException catch (err) {
//       print(err);
//       ToastService().e(err.response!.data['message']);
//       print(err.response!);
//     }
//     setSubmitLoading(false);
//   }
// }

import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginState extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  Dio dio = Dio();
  String? email;
  String? password;

  onEmailChanged(val) {
    email = val;
    notifyListeners();
  }

  onPasswordChanged(val) {
    password = val;
    notifyListeners();
  }

  bool isPasswordVisible = true;

  onVisibilityChanged() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  bool submitLoading = false;
  setSubmitLoading(val) {
    submitLoading = val;
    notifyListeners();
  }

  List errors = [];

  onLogin() async {
    setSubmitLoading(true);
    var loginData = {
      "email": email,
      "password": password,
    };
    print(loginData);
    try {
      var response = await dio.post(
        "$base_url/login",
        options: Options(
          headers: {
            "apikey": "elab-ktmrush-api-v1-2023",
            'Accept': 'application/json',
          },
        ),
        data: loginData,
      );

      ToastService().s(response.data['message']);

      LocalStorageService()
          .write(LocalStorageKeys.accessToken, response.data['data']['_token']);

      print('yo useId ho ${response.data['data']['user']['id']}');
      print('login vayo');

      navigatorKey.currentState!.pushNamed(SplashScreen.id);
      notifyListeners();
    } on DioException catch (err) {
      print(err);
      ToastService().e(err.response!.data['message']);
      print(err.response!);
    }
    setSubmitLoading(false);
  }

  String? googleToken;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth auth = FirebaseAuth.instance;

  signInWithGoogle() async {
    EasyLoading.show();
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      googleToken = googleAuth.accessToken;
      LocalStorageService().write(LocalStorageKeys.googleToken, googleToken);

      final UserCredential authResult =
          await auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        print('User is signed in: ${user.displayName}');
        print('Access Token: ${googleAuth.accessToken}');
        onGoogleLogin();
      } else {
        print('Error signing in with Google: User is null');
      }
    } catch (error) {
      print('Error signing in with Google: $error');
    }
    EasyLoading.dismiss();
  }

  onGoogleLogin() async {
    var data = {'access_token': googleToken};
    print('yo google ko $data');
    setSubmitLoading(true);
    try {
      var response = await dio.post(
        "$base_url/google/login",
        options: Options(
          headers: {
            "apikey": "elab-ktmrush-api-v1-2023",
            'Accept': 'application/json',
          },
        ),
        data: data,
      );

      ToastService().s(response.data['message']);

      LocalStorageService()
          .write(LocalStorageKeys.accessToken, response.data['token']);
      print('login vayo');

      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
      notifyListeners();
    } on DioException catch (err) {
      print(err);
      ToastService().e(err.response!.data['message']);
      print(err.response!);
    }
    setSubmitLoading(false);
  }

  // signInWithApple() async {
  //   EasyLoading.show();
  //   try {
  //     final AuthorizationCredentialAppleID appleCredential =
  //         await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     print(appleCredential.toString());

  //     final AuthCredential credential = OAuthProvider("apple.com").credential(
  //       idToken: appleCredential.identityToken,
  //       accessToken: appleCredential.authorizationCode,
  //     );

  //     final UserCredential authResult =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     final User? user = authResult.user;

  //     if (user != null) {
  //       print('User is signed in: ${user.displayName}');
  //       onAppleLogin(appleCredential.identityToken);
  //     } else {
  //       print('Error signing in with Apple: User is null');
  //     }
  //   } catch (error) {
  //     print('Error signing in with Apple: $error');
  //   }
  //   EasyLoading.dismiss();
  // }

  // Future<void> signInWithApple() async {
  //   EasyLoading.show();
  //   try {
  //     final AuthorizationCredentialAppleID appleCredential =
  //         await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         AppleIDAuthorizationScopes.email,
  //         AppleIDAuthorizationScopes.fullName,
  //       ],
  //     );
  //     print(appleCredential.email);
  //     print(appleCredential.identityToken);
  //     print(appleCredential.givenName);
  //     onAppleLogin(appleCredential.identityToken);

  //     // print('Full Name: ${appleCredential.fullName.givenName} ${appleCredential.fullName.familyName}');
  //   } catch (error) {
  //     print('Error signing in with Apple: $error');
  //   }
  //   EasyLoading.dismiss();
  // }

  // onAppleLogin(String? appleToken) async {
  //   var data = {'access_token': appleToken};
  //   print('yo apple ko $data');
  //   setSubmitLoading(true);
  //   try {
  //     var response = await dio.post(
  //       "$base_url/apple/login",
  //       options: Options(
  //         headers: {
  //           "apikey": "elab-ktmrush-api-v1-2023",
  //           'Accept': 'application/json',
  //         },
  //       ),
  //       data: data,
  //     );

  //     ToastService().s(response.data['message']);

  //     LocalStorageService()
  //         .write(LocalStorageKeys.accessToken, response.data['token']);
  //     print('login vayo');

  //     navigatorKey.currentState!
  //         .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
  //     notifyListeners();
  //   } on DioException catch (err) {
  //     print(err);
  //     ToastService().e(err.response!.data['message']);
  //     print(err.response!);
  //   }
  //   setSubmitLoading(false);
  // }

  Future<void> signInWithApple() async {
    EasyLoading.show();
    try {
      print('Starting Apple Sign-In process...');
      final AuthorizationCredentialAppleID appleCredential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      print('Apple Sign-In successful');
      print('Email: ${appleCredential.email}');
      print('Identity Token: ${appleCredential.identityToken}');
      print('Given Name: ${appleCredential.givenName}');

      await onAppleLogin(appleCredential.identityToken);
    } catch (error) {
      print('Error signing in with Apple: $error');
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> onAppleLogin(String? appleToken) async {
    var data = {'access_token': appleToken};
    print('Sending data to server: $data');
    setSubmitLoading(true);
    try {
      var response = await dio.post(
        "$base_url/apple/login",
        options: Options(
          headers: {
            "apikey": "elab-ktmrush-api-v1-2023",
            'Accept': 'application/json',
          },
        ),
        data: data,
      );

      ToastService().s(response.data['message']);
      await LocalStorageService()
          .write(LocalStorageKeys.accessToken, response.data['token']);
      print('Login successful, navigating to HomeDisplay');

      navigatorKey.currentState!
          .pushNamedAndRemoveUntil(HomeDisplay.id, (route) => false);
      notifyListeners();
    } on DioException catch (err) {
      print('DioException: $err');
      ToastService().e(err.response?.data['message'] ?? 'Unknown error');
    } catch (error) {
      print('Unknown error: $error');
    } finally {
      setSubmitLoading(false);
    }
  }
}
