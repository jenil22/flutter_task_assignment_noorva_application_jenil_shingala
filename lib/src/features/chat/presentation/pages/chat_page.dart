import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/theme/app_colors.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/widgets/noorva_input_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Sticky App Bar at the top
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeaderIcon(
                    context,
                    Icons.arrow_back_ios_new,
                    onTap: () => Navigator.pop(context),
                  ),
                  _buildGuideHeaderButton(),
                  _buildHeaderIcon(context, Icons.edit_note),
                ],
              ),
              const SizedBox(height: 10),

              // Scrollable content area
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Chat Bubble
                      FadeInRight(
                        duration: const Duration(milliseconds: 600),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(left: 60),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: AppColors.cardBackground,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                                bottomLeft: Radius.circular(32),
                                bottomRight: Radius.circular(8),
                              ),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.05),
                              ),
                            ),
                            child: const Text(
                              'I see you are ready for guidance. I will walk with you from here. What should we plan out first?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                height: 1.5,
                              ),
                            ),
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
                              top: 40,
                              right: 120,
                              child: _buildBubble(15),
                            ),
                            Positioned(
                              top: 70,
                              right: 135,
                              child: _buildBubble(10),
                            ),
                            SizedBox(
                              height: 400,
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
                    ],
                  ),
                ),
              ),

              // Sticky Input Bar at the bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 10),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 400),
                  child: const NoorvaInputBar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderIcon(
    BuildContext context,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Icon(icon, size: 24, color: Colors.white),
      ),
    );
  }

  Widget _buildGuideHeaderButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.lightbulb_outline, size: 20, color: Colors.white),
          const SizedBox(width: 8),
          const Text(
            'Noorva Guide',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
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
