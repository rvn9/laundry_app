import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'auth_guard.dart';
import 'injector.dart';
import 'routes/router.gr.dart';

void runTestApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.initialize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const TestApp2());
}

void main() {
  runTestApp();
}

class TestApp2 extends StatelessWidget {
  const TestApp2({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouters(authGuard: AuthGuard());
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (BuildContext context, Widget? child) => MaterialApp.router(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
      ),
    );
  }
}
