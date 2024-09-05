import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/account_form.dart';
import 'package:flutter_app_1/screens/customerDetail_screen.dart';
import 'package:flutter_app_1/screens/customer_profile.dart';
import 'package:flutter_app_1/screens/customer_screen.dart';
import 'package:flutter_app_1/screens/login_screen.dart';
import 'package:flutter_app_1/screens/register_screen.dart';
import 'package:flutter_app_1/screens/search_user_screen.dart';
import 'package:flutter_app_1/widgets/bottom_bar.dart';
import 'package:flutter_app_1/screens/splash_screen.dart';
import 'package:flutter_app_1/widgets/history_approved_detail.dart';
import 'package:flutter_app_1/widgets/history_processing_detail.dart';
import 'package:flutter_app_1/widgets/information_availble.dart';

class AppRoutes {
  static const String splash = '/';
  static const String searchUser = '/search_user'; 
  static const String register = '/register';
  static const String login = '/login';
  static const String home = '/home';
  static const String form = '/account_form';
  static const String customer = '/customer';
  static const String customerProfile = '/customer_profile';
  static const String informationAvailable = '/information_available';
  static const String processingDetails = '/processing_details';
  static const String approvedDetails = '/approved_details';
  static const String customerDetails = '/customer_details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case searchUser:
        return MaterialPageRoute(builder: (_) => SearchUserScreen());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => BottomNavBar());
      case form:
        return MaterialPageRoute(builder: (_) => AccountForm());
      case customer:
        return MaterialPageRoute(builder: (_) => CustomerScreen());
      case customerProfile:
        return MaterialPageRoute(builder: (_) => CustomerProfile());
      case informationAvailable:
        return MaterialPageRoute(builder: (_) => InformationAvailable());
      case processingDetails:
        return MaterialPageRoute(builder: (_) => HistoryProcessingDetail());
      case approvedDetails:
        return MaterialPageRoute(builder: (_) => HistoryApprovedDetail());
      case customerDetails:
        return MaterialPageRoute(builder: (_) => CustomerDetailScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}