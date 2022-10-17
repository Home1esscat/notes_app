import 'package:app_client/blocs/notes_color_cubit.dart';
import 'package:app_client/blocs/notes_cubit.dart';
import 'package:app_client/ui/main_screen.dart';
import 'package:app_client/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NotesCubit>(
          create: (context) => NotesCubit(),
          dispose: (context, value) => value.close(),
        ),
        Provider<NotesColorCubit>(
          create: (context) => NotesColorCubit(),
          dispose: (context, value) => value.close(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: const MainScreen(),
      ),
    );
  }
}
