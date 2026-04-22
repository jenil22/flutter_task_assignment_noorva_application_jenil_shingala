import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/theme/app_colors.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/widgets/noorva_input_bar.dart';

import '../widgets/priority_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Elements
            Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.02),
                ),
              ),
            ),

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
                  const SizedBox(height: 20),

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
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: AppColors.cardBackground,
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
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'You need to look into your\nweekend marathon training\nplan',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.textSecondary,
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Wizard Character Image
                          FadeInUp(
                            duration: const Duration(milliseconds: 1000),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 0,
                                  right: 80,
                                  child: _buildBubble(15),
                                ),
                                Positioned(
                                  top: 30,
                                  right: 100,
                                  child: _buildBubble(10),
                                ),
                                SizedBox(
                                  height: 350,
                                  child: Image.network(
                                    'https://img.freepik.com/premium-photo/3d-cartoon-character-old-man-wizard-standing-with-wooden-staff_1020697-94186.jpg',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) =>
                                        const Icon(
                                      Icons.person,
                                      size: 200,
                                      color: Colors.white24,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

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
        color: AppColors.cardBackground,
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
