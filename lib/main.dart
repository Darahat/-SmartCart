// For Authentication
// https://github.com/hassank185/Flutter-Firebase-Series/blob/main/lib/features/user_auth/presentation/widgets/form_container_widget.dart
// https://www.youtube.com/watch?v=YVYIPIow418&t=196s
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smartCart/firebase_options.dart';
import 'package:smartCart/pages/home_page.dart';
import 'package:smartCart/pages/login_page.dart';
import 'package:smartCart/pages/sign_up_page.dart';
import 'package:smartCart/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
              // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
              child: HomePage(),
            ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
//         routes: {
//           '/': (context) => const LoginPage(),
//           '/signUp': (context) => const SignUpPage()
//         });
//   }
// }
