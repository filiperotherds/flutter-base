import 'package:flutter/material.dart';

import 'package:flutter_tcc/core/theme/app_theme.dart';
import 'package:flutter_tcc/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_tcc/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tcc/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.sl<AuthBloc>(),
      child: MaterialApp(
        title: 'Base Brasil',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const LoginPage(),
      ),
    );
  }
}
