import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Color backgroundColor = Color(0xFF080C12);
  static const Color whiteText = Color(0xFFFFFFFF);
  static const Color lightText = Color(0xFFC7E5F4);
  static const Color mutedText = Color(0xFF7893AA);
  static const Color darkButtonText = Color(0xFF06121A);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaler: const TextScaler.linear(1.0),
      ),
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 36),

                Container(
                  width: 66,
                  height: 66,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF45BFE7),
                        Color(0xFF55F3ED),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'e',
                    style: TextStyle(
                      color: darkButtonText,
                      fontSize: 31,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Aptos',
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'EMC People Platform',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: whiteText,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Aptos',
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Sign in with your Emirates Mobility account to\ncontinue.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: lightText,
                    fontSize: 15,
                    height: 1.45,
                    fontFamily: 'Aptos',
                  ),
                ),

                const SizedBox(height: 36),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sign in with Entra ID clicked'),
                          ),
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF44BFE6),
                              Color(0xFF57F2EC),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.window,
                              size: 16,
                              color: darkButtonText,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Sign in with Entra ID',
                              style: TextStyle(
                                color: darkButtonText,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                fontFamily: 'Aptos',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                const Text(
                  'Authentication is handled by your organization\'s Microsoft Entra ID.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mutedText,
                    fontSize: 12,
                    height: 1.4,
                    fontFamily: 'Aptos',
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'No separate password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: mutedText,
                    fontSize: 12,
                    height: 1.4,
                    fontFamily: 'Aptos',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}