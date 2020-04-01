import 'package:auto_route/auto_route_annotations.dart';
import 'package:share_txt/ui/page/home_page.dart';
import 'package:share_txt/ui/page/login_page.dart';
import 'package:share_txt/ui/page/splash_screen_page.dart';

@MaterialAutoRouter()
class $Router {

  @initial
  SpleshScreenPage spleshScreenPage;
  
  LoginPage loginPage;

  HomePage homePage;
}
