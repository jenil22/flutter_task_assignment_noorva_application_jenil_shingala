import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/theme/app_colors.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/widgets/noorva_input_bar.dart';

import '../widgets/priority_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Wizard Character - Fixed for the whole screen
            Positioned.fill(
              child: Image.asset(
                'assets/images/bgimg.png',
                fit: BoxFit.cover,
                alignment: Alignment.bottomCenter,
              ),
            ),

            // Background Decorative Elements - Responsive positioning
            Positioned(
              top: screenHeight * 0.12,
              right: -size.width * 0.12,
              child: Container(
                width: size.width * 0.5,
                height: size.width * 0.5,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.02),
                ),
              ),
            ),

            // Bubbles - Responsive positioning
            Positioned(
              top: screenHeight * 0.35,
              right: size.width * 0.2,
              child: _buildBubble(15),
            ),
            Positioned(
              top: screenHeight * 0.38,
              right: size.width * 0.25,
              child: _buildBubble(10),
            ),

            // Main UI Layer
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Sticky App Bar at the top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildHeaderIcon(Icons.menu),
                      _buildHeaderIcon(Icons.notifications_outlined),
                    ],
                  ),
                  const SizedBox(height: 10),

                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          // Welcome Message
                          FadeInDown(
                            duration: const Duration(milliseconds: 800),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color:
                                    AppColors.cardBackground.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(32),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.05),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Hey Rakesh',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width * 0.07,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'You need to look into your\nweekend marathon training\nplan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: size.width * 0.04,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Responsive spacer to let the wizard show through
                          SizedBox(height: screenHeight * 0.25),

                          // Priority Card
                          FadeInUp(
                            delay: const Duration(milliseconds: 400),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, '/chat'),
                              child: PriorityCard(),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  // Sticky Input Bar at the bottom
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      child: const NoorvaInputBar(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withOpacity(0.8),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Icon(icon, size: 24, color: Colors.white),
    );
  }

  Widget _buildBubble(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
    );
  }
}
