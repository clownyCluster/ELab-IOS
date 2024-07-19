import 'package:elab/Authentication/Otp_Module/otp_screen.dart';
import 'package:elab/Authentication/Otp_Module/otp_state.dart';
import 'package:elab/Authentication/Reset_password_model/reset_password_screen.dart';
import 'package:elab/Authentication/Reset_password_model/reset_password_state.dart';
import 'package:elab/Authentication/forgot_password_module/forgot_password.dart';
import 'package:elab/Authentication/forgot_password_module/forgot_password_state.dart';
import 'package:elab/Authentication/login_module/login_screen.dart';
import 'package:elab/Authentication/login_module/login_state.dart';
import 'package:elab/Authentication/register_module/register_screen.dart';
import 'package:elab/Authentication/register_module/register_state.dart';
import 'package:elab/Drawer_Pages/AboutUs_Module/about_us_screen.dart';
import 'package:elab/Drawer_Pages/AboutUs_Module/about_us_state.dart';
import 'package:elab/Drawer_Pages/Blogs_Module/blog_screen.dart';
import 'package:elab/Drawer_Pages/Blogs_Module/blogs_state.dart';
import 'package:elab/Drawer_Pages/Teams_Module/teams_screen.dart';
import 'package:elab/Drawer_Pages/Teams_Module/teams_state.dart';
import 'package:elab/constant/constant.dart';
import 'package:elab/pages/AccountModule/account_screen.dart';
import 'package:elab/pages/AccountModule/account_state.dart';
import 'package:elab/pages/Covide_Module/covide.dart';
import 'package:elab/pages/Covide_Module/covide_state.dart';
import 'package:elab/pages/DetailPage/Hemogram_Module/hemogram_screen.dart';
import 'package:elab/pages/DetailPage/Hemogram_Module/hemogram_state.dart';
import 'package:elab/pages/DetailPage/Offers_Details_Module/offers_datails_state.dart';
import 'package:elab/pages/DetailPage/Offers_Details_Module/offers_details.dart';
import 'package:elab/pages/FilterModule/package_module/package_screen.dart';
import 'package:elab/pages/FilterModule/package_module/package_state.dart';
import 'package:elab/pages/FilterModule/test_module/test_filter_screen.dart';
import 'package:elab/pages/FilterModule/test_module/test_filter_state.dart';

import 'package:elab/pages/HealthCheckUpModule/health_checkup_screen.dart';
import 'package:elab/pages/HealthCheckUpModule/health_checkup_state.dart';
import 'package:elab/pages/HealthPackagesModule/health_packages_screen.dart';
import 'package:elab/pages/HealthPackagesModule/health_packages_state.dart';
import 'package:elab/pages/History_Detials_Module/history_screen.dart';
import 'package:elab/pages/History_Detials_Module/history_state.dart';
import 'package:elab/pages/Home_Collection_Module/home_collection_screen.dart';
import 'package:elab/pages/Home_Collection_Module/home_collection_state.dart';
import 'package:elab/pages/Medical_History/medical_history.dart';
import 'package:elab/pages/Medical_History/medical_history_state.dart';
import 'package:elab/pages/NoInternet/no_interner_state.dart';
import 'package:elab/pages/NoInternet/no_internet_screen.dart';
import 'package:elab/pages/Payment_for_self/payment_for_self_screen.dart';
import 'package:elab/pages/Payment_for_self/payment_for_self_state.dart';
import 'package:elab/pages/TestsModule/individule_test_screen.dart';
import 'package:elab/pages/TestsModule/individule_test_state.dart';
import 'package:elab/pages/MyUploadsModule/uploads_screen.dart';
import 'package:elab/pages/MyUploadsModule/uploads_state.dart';
import 'package:elab/pages/DetailPage/PackageDetailsModule/package_screen.dart';
import 'package:elab/pages/DetailPage/PackageDetailsModule/package_state.dart';
import 'package:elab/pages/PrimaryAddressModule/address_screen.dart';
import 'package:elab/pages/PrimaryAddressModule/address_state.dart';
import 'package:elab/pages/BookForOtherModule/book_for_other_screen.dart';
import 'package:elab/pages/BookForOtherModule/book_for_other_state.dart';
import 'package:elab/pages/CheckoutModule/checkout_screen.dart';
import 'package:elab/pages/CheckoutModule/checkout_state.dart';
import 'package:elab/pages/OrdersHistoryDetailsModule/order_details_screen.dart';
import 'package:elab/pages/OrdersHistoryDetailsModule/order_details_state.dart';
import 'package:elab/pages/OrdesHistoryModule/orders_screen.dart';
import 'package:elab/pages/OrdesHistoryModule/orders_state.dart';
import 'package:elab/pages/PaymentModule/payment_screen.dart';
import 'package:elab/pages/PaymentModule/payment_state.dart';
import 'package:elab/pages/PaymentOptionsModule/payment_options_screen.dart';
import 'package:elab/pages/PaymentOptionsModule/payment_options_state.dart';
import 'package:elab/pages/ReportModule/report_screen.dart';
import 'package:elab/pages/ReportModule/report_state.dart';
import 'package:elab/pages/RequestCallback_Module/callback_screen.dart';
import 'package:elab/pages/RequestCallback_Module/callback_state.dart';
import 'package:elab/pages/ShippingAddressModule/shipping_address_screen.dart';
import 'package:elab/pages/ShippingAddressModule/shipping_address_state.dart';
import 'package:elab/pages/UpdatePassword/update_password.dart';
import 'package:elab/pages/UpdatePassword/update_password_state.dart';
import 'package:elab/pages/Upload_Prescription_Module/upload_screen.dart';
import 'package:elab/pages/Upload_Prescription_Module/upload_state.dart';
import 'package:elab/screen/HomeModule/home_display.dart';
import 'package:elab/screen/HomeModule/home_display_state.dart';
import 'package:elab/screen/LogoutScreenModule/new_home_screen.dart';
import 'package:elab/screen/OfferModule/offer_screen.dart';
import 'package:elab/screen/OfferModule/offer_state.dart';
import 'package:elab/screen/onBoadingModule/on_boarding_screen.dart';
import 'package:elab/screen/onBoadingModule/on_boarding_state.dart';
// import 'package:elab/screen/HomeScreenModule/home_screen.dart';
// import 'package:elab/screen/HomeScreenModule/home_state.dart';
import 'package:elab/screen/splashModule/splash_screen.dart';
import 'package:elab/screen/splashModule/splassh_state.dart';
import 'package:elab/service/local_storage_service.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:elab/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'Drawer_Pages/Drawer_Model/drawer_screen.dart';
import 'Drawer_Pages/Drawer_Model/drawer_state.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalStorageService.init();
  await GetStorage.init;

  runApp(Elab());
}

void configLoading() {
  EasyLoading.instance
    // ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = primaryColor
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class Elab extends StatelessWidget {
  const Elab({super.key});

  @override
  Widget build(BuildContext context) {
    MaterialColor mainAppColor = const MaterialColor(
      0xFF283891,
      <int, Color>{
        50: Color(0xFF283891),
        100: Color(0xFF283891),
        200: Color(0xFF283891),
        300: Color(0xFF283891),
        400: Color(0xFF283891),
        500: Color(0xFF283891),
        600: Color(0xFF283891),
        700: Color(0xFF283891),
        800: Color(0xFF283891),
        900: Color(0xFF283891),
      },
    );
    return OKToast(
      child: GetMaterialApp(
        theme: ThemeData(
          primarySwatch: mainAppColor,
          splashColor: primaryColor,
          datePickerTheme: DatePickerThemeData(
            headerForegroundColor: whiteColor,
            rangePickerBackgroundColor: primaryColor,
            headerBackgroundColor: primaryColor,
            dayStyle: kTextStyle(),
            rangePickerShadowColor: primaryColor,
            headerHelpStyle: kTextStyle(),
            headerHeadlineStyle: kTextStyle(),
            rangeSelectionBackgroundColor: primaryColor,
          ),
          timePickerTheme: TimePickerThemeData(
              dialHandColor: primaryColor.withOpacity(0.9),
              hourMinuteColor: Color.fromARGB(255, 212, 200, 200),
              dayPeriodColor: Color.fromARGB(255, 212, 200, 200),
              cancelButtonStyle: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                      Color.fromARGB(255, 244, 67, 54)))),
        ),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.id,
        // initialRoute: TutorialScreen.id,
        routes: {
          OnBoardingScreen.id: (context) => ChangeNotifierProvider(
                child: OnBoardingScreen(),
                create: (_) => OnBoardingState(),
              ),
          HomeDisplay.id: (context) => ChangeNotifierProvider(
                child: WillPopScope(
                    onWillPop: () async {
                      return showAppExitConfirmationDialog(context);
                    },
                    child: HomeDisplay()),
                create: (_) => HomeDisplayState(context),
              ),
          LoginScreen.id: (context) => ChangeNotifierProvider(
                child: LoginScreen(),
                create: (_) => LoginState(),
              ),
          RegisterScreen.id: (context) => ChangeNotifierProvider(
                child: RegisterScreen(),
                create: (_) => RegisterState(),
              ),
          SplashScreen.id: (context) => ChangeNotifierProvider(
                child: SplashScreen(),
                create: (_) => SplashState(),
              ),
          CheckoutScreen.id: (context) => ChangeNotifierProvider(
                child: CheckoutScreen(),
                create: (_) => CheckoutState(),
              ),
          PaymentScreen.id: (context) => ChangeNotifierProvider(
                child: PaymentScreen(),
                create: (_) => PaymentState(),
              ),
          BookForOtherScreen.id: (context) => ChangeNotifierProvider(
                child: BookForOtherScreen(),
                create: (_) => BookForOtherState(),
              ),
          PaymentOptionsScreen.id: (context) => ChangeNotifierProvider(
                child: PaymentOptionsScreen(),
                create: (_) => PaymentOptionsState(context),
              ),
          ReportScreen.id: (context) => ChangeNotifierProvider(
            
                child: ReportScreen(),
                create: (_) => ReportState(),
              ),
          AccountScreen.id: (context) => ChangeNotifierProvider(
                child: AccountScreen(),
                create: (_) => AccountState(),
              ),
          OrderScreen.id: (context) => ChangeNotifierProvider(
                child: OrderScreen(),
                create: (_) => OrderState(),
              ),
          OrderDetailsScreen.id: (context) => ChangeNotifierProvider(
                child: OrderDetailsScreen(),
                create: (_) => OrderDetailsState(context),
              ),
          AddressScreen.id: (context) => ChangeNotifierProvider(
                child: AddressScreen(),
                create: (_) => AddressState(),
              ),
          ShippingAddressScreen.id: (context) => ChangeNotifierProvider(
                child: ShippingAddressScreen(),
                create: (_) => ShippingAddressState(),
              ),
          UpdatePasswordScreen.id: (context) => ChangeNotifierProvider(
                child: UpdatePasswordScreen(),
                create: (_) => UpdatePasswordState(),
              ),
          HealthPackagesScreen.id: (context) => ChangeNotifierProvider(
                child: HealthPackagesScreen(),
                create: (_) => HealthPackagesState(),
              ),
          HealthCheckupScreen.id: (context) => ChangeNotifierProvider(
                child: HealthCheckupScreen(),
                create: (_) => HealthCheckupState(),
              ),
          IndividuleTestScreen.id: (context) => ChangeNotifierProvider(
                child: IndividuleTestScreen(),
                create: (_) => IndividuleTestState(),
              ),
          HemogramScreen.id: (context) => ChangeNotifierProvider(
                child: HemogramScreen(),
                create: (_) => HemogramState(context),
              ),
          PackageScreen.id: (context) => ChangeNotifierProvider(
                child: PackageScreen(),
                create: (_) => PackageState(context),
              ),
          UploadScreen.id: (context) => ChangeNotifierProvider(
                child: UploadScreen(),
                create: (_) => UploadState(),
              ),
          AboutUsScreen.id: (context) => ChangeNotifierProvider(
                child: AboutUsScreen(),
                create: (_) => AboutUsState(),
              ),
          ForgotPassword.id: (context) => ChangeNotifierProvider(
                child: ForgotPassword(),
                create: (_) => ForgotPasswordState(),
              ),
          BlogsScreen.id: (context) => ChangeNotifierProvider(
                child: BlogsScreen(),
                create: (_) => BlogsState(),
              ),
          HomeColloctionScreen.id: (context) => ChangeNotifierProvider(
                child: HomeColloctionScreen(),
                create: (_) => HomeCollectionState(),
              ),
          CovideScreen.id: (context) => ChangeNotifierProvider(
                child: CovideScreen(),
                create: (_) => CovideState(),
              ),
          RequestCallBackScreen.id: (context) => ChangeNotifierProvider(
                child: RequestCallBackScreen(),
                create: (_) => RequestCallBackState(),
              ),
          UploadePrescriptionScreen.id: (context) => ChangeNotifierProvider(
                child: UploadePrescriptionScreen(),
                create: (_) => UploadePrescriptionState(),
              ),
          TeamsScreen.id: (context) => ChangeNotifierProvider(
                child: TeamsScreen(),
                create: (_) => TeamsState(),
              ),
          OffersDetailsScreen.id: (context) => ChangeNotifierProvider(
                create: (_) => OffersDetailsState(context),
                child: OffersDetailsScreen(),
              ),
          PaymentForMySelfScreen.id: (context) => ChangeNotifierProvider(
                child: PaymentForMySelfScreen(),
                create: (_) => PaymentForMySelfState(context),
              ),
          OtpScreen.id: (context) => ChangeNotifierProvider(
                create: (_) => OtpState(context),
                child: OtpScreen(),
              ),
          ResetPasswordScreen.id: (context) => ChangeNotifierProvider(
                child: ResetPasswordScreen(),
                create: (_) => ResetPasswordState(),
              ),
          DrawerScreen.id: (context) => ChangeNotifierProvider(
                child: DrawerScreen(),
                create: (_) => DrawerState(),
              ),
          OfferScreen.id: (context) => ChangeNotifierProvider(
                child: OfferScreen(),
                create: (_) => OfferState(),
              ),
          ConnectivityScreen.id: (context) => ChangeNotifierProvider(
                child: ConnectivityScreen(),
                create: (_) => ConnectivityProvider(),
              ),
          TestFilterScreen.id: (context) => ChangeNotifierProvider(
                child: TestFilterScreen(),
                create: (_) => TestFilterState(context),
              ),
          PackageFilterScreen.id: (context) => ChangeNotifierProvider(
                child: PackageFilterScreen(),
                create: (_) => PackageFilterState(context),
              ),
          HistoryScreen.id: (context) => ChangeNotifierProvider(
                child: HistoryScreen(),
                create: (_) => HistoryState(context),
              ),
          MedicalHistoryScreen.id: (context) => ChangeNotifierProvider(
                child: MedicalHistoryScreen(),
                create: (_) => MedicalHistoryState(),
              ),
        },
        builder: EasyLoading.init(),
      ),
    );
  }
}
