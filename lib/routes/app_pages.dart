import 'package:get/get.dart';
import 'package:student_project1/features/auth/presentation/screens/forgetpassword_screen.dart';
import 'package:student_project1/features/auth/presentation/screens/hellomogeh_screen.dart';
import 'package:student_project1/features/auth/presentation/screens/hellotecher_screen.dart';
import 'package:student_project1/features/auth/presentation/screens/logIn_screen.dart';
import 'package:student_project1/features/home/presentation/bindings/home_binding.dart';
import 'package:student_project1/features/home/presentation/screens/home_screen.dart';
import 'package:student_project1/features/home/presentation/screens/marks_student_screen.dart';
import 'package:student_project1/features/home/presentation/screens/notifincation_screen.dart';
import 'package:student_project1/features/navigation/navigation_binding.dart';
import 'package:student_project1/features/navigation/navigation_widget.dart';
import 'package:student_project1/routes/app_routes.dart';
import 'package:student_project1/features/auth/presentation/bindings/auth_binding.dart';

import '../features/auth/presentation/screens/first_forgetpassword_screen.dart';
import '../features/auth/presentation/screens/firstregister_screen.dart';
import '../features/auth/presentation/screens/hellostudent_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/sepalsh_screen.dart';
import '../features/home/presentation/screens/fees_screen.dart';

class AppPages {
  // تحديد الصفحة الابتدائية للتطبيق
  static const String INITIAL = Routes.SEPLASH;

  static final List<GetPage> routes = [

    ///auth
    GetPage(
      name: Routes.LOGIN,
      page: () => const LogInScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn, // تأثير الانتقال بين الصفحات
    ),
    GetPage(
      name: Routes.SEPLASH,
      page: () => const SplashScreen (),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: Routes.HELLO3,
      page: () => const HellomogehScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HELLO2,
      page: () => const HellotecherScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HELLO1,
      page: () => const HellostudentScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.REGISTER1,
      page: () => const FirstRegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.REGISTER2,
      page: () => const RegisterScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FORGETPASSWORD,
      page: () => const ForgetpasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FirstFORGETPASSWORD,
      page: () => const FirstForgetpasswordScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),

    ////Home
    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotifincationScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.MARKS,
      page: () => const MarksStudentScreen(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.FEES,
      page: () => const FeesScreen(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
