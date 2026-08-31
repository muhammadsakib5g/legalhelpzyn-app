import 'package:flutter/material.dart';

import 'theme/brand.dart';

void main() => runApp(const LegalHelpzynApp());

class LegalHelpzynApp extends StatelessWidget {
  const LegalHelpzynApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LegalHelpzyn',
      debugShowCheckedModeBanner: false,
      theme: BrandTheme.light(),
      home: const PlaceholderScreen(),
    );
  }
}

/// Temporary landing screen.
///
/// The app is an empty shell on purpose: the API it will consume is still
/// being built in the `legalhelpzyn` Laravel repo. See CLAUDE.md for the
/// phase plan that replaces this screen.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/brand/logo.png', width: 260),
                const SizedBox(height: 32),
                Text(
                  'Legal services, handled properly.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: BrandColors.navy,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'App under development.',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: BrandColors.muted),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
