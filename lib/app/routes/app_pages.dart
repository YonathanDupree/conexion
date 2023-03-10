import 'package:get/get.dart';

import '../modules/calendar/bindings/calendar_binding.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/contact/bindings/contact_binding.dart';
import '../modules/contact/views/contact_view.dart';
import '../modules/coupon/bindings/coupon_binding.dart';
import '../modules/coupon/views/coupon_view.dart';
import '../modules/forgot/bindings/forgot_binding.dart';
import '../modules/forgot/views/forgot_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nutritionist/bindings/nutritionist_binding.dart';
import '../modules/nutritionist/views/nutritionist_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/psychologist/bindings/psychologist_binding.dart';
import '../modules/psychologist/views/psychologist_view.dart';
import '../modules/request/bindings/request_binding.dart';
import '../modules/request/views/request_view.dart';
import '../modules/reserve/bindings/reserve_binding.dart';
import '../modules/reserve/views/reserve_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/status/bindings/status_binding.dart';
import '../modules/status/views/status_view.dart';
import '../modules/subsection/bindings/subsection_binding.dart';
import '../modules/subsection/views/subsection_view.dart';
import '../modules/sure/bindings/sure_binding.dart';
import '../modules/sure/views/sure_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT,
      page: () => const ForgotView(),
      binding: ForgotBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.COUPON,
      page: () => const CouponView(),
      binding: CouponBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => const ContactView(),
      binding: ContactBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR,
      page: () => const CalendarView(),
      binding: CalendarBinding(),
    ),
    GetPage(
      name: _Paths.STATUS,
      page: () => const StatusView(),
      binding: StatusBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST,
      page: () => const RequestView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONIST,
      page: () => const NutritionistView(),
      binding: NutritionistBinding(),
    ),
    GetPage(
      name: _Paths.PSYCHOLOGIST,
      page: () => const PsychologistView(),
      binding: PsychologistBinding(),
    ),
    GetPage(
      name: _Paths.RESERVE,
      page: () => const ReserveView(),
      binding: ReserveBinding(),
    ),
    GetPage(
      name: _Paths.SURE,
      page: () => const SureView(),
      binding: SureBinding(),
    ),
    GetPage(
      name: _Paths.SUBSECTION,
      page: () => const SubsectionView(),
      binding: SubsectionBinding(),
    ),
  ];
}
