import 'package:flutter/material.dart';
import 'package:study/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'animation/background_painter.dart';

// on opening of screen we will make show login page
// if he/she is not having account he/she can create one
//after login a splash screen will come which will send them to home.dart

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Needed for Firebase core
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(child: Text('Something went wrong'));
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // Initialize Lit Firebase Auth. Needs to be called before
          // `MaterialApp`, to ensure all of the child widget, even when
          // navigating to a new route, has access to the Lit auth methods
          return LitAuthInit(
            authProviders: const AuthProviders(
              emailAndPassword: true, // enabled by default
              google: true,
              apple: true,
              anonymous: true,
              github: true,
              twitter: true,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Study',
              themeMode: ThemeMode.light,
              darkTheme: ThemeData.dark(),
              theme: ThemeData(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: GoogleFonts.muliTextTheme(),
                accentColor: ExtendedColor.lightBlue,
                appBarTheme: const AppBarTheme(
                  brightness: Brightness.dark,
                  color: ExtendedColor.darkBlue,
                ),
              ),
              home: LogInscreen(),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
