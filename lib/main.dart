import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/viewmodels/dashboard_viewmodel.dart';
import 'presentation/viewmodels/nft_marketplace_viewmodel.dart';
import 'presentation/views/dashboard_view.dart';
import 'presentation/views/nft_marketplace_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => NFTMarketplaceViewModel()),
      ],
      child: MaterialApp(
        title: 'Horizon Dashboard',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF4318FF),
          scaffoldBackgroundColor: const Color(0xFF111C44),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
          ),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF4318FF),
            secondary: Color(0xFF6AD2FF),
            background: Color(0xFF111C44),
            surface: Color(0xFF1B254B),
          ),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardView(),
          '/nft-marketplace': (context) => const NFTMarketplaceView(),
        },
      ),
    );
  }
}
