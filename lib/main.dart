import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_ui/Presentation/Main_page/screen_main_page.dart';
import 'package:netflix_ui/application/downloads/downloads_bloc.dart';
import 'package:netflix_ui/application/fastLaugh/fast_laugh_bloc.dart';
import 'package:netflix_ui/application/search/searchresult_bloc.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/d/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
         BlocProvider(create: (ctx) => getIt<SearchresultBloc>()),
          BlocProvider(create: (ctx) => getIt<FastLaughBloc>())
         ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              titleTextStyle: TextStyle(color: Colors.white)),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
              .copyWith(background: Colors.black),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
