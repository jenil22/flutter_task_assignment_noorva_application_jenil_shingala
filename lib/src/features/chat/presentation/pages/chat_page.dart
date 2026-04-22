import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/theme/app_colors.dart';
import 'package:flutter_task_assignment_noorva_application_jenil_shingala/src/core/widgets/noorva_input_bar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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

            // Bubbles (Background layer) - Responsive positioning
            Positioned(
              top: screenHeight * 0.4,
              right: size.width * 0.3,
              child: _buildBubble(15),
            ),
            Positioned(
              top: screenHeight * 0.44,
              right: size.width * 0.35,
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
                          const SizedBox(height: 30),
                          // Chat Bubble
                          FadeInRight(
                            duration: const Duration(milliseconds: 600),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                margin: EdgeInsets.only(left: size.width * 0.15),
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: AppColors.cardBackground.withOpacity(0.8),
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
                                child: Text(
                                  'I see you are ready for guidance. I will walk with you from here. What should we plan out first?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width * 0.04,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Large spacer to let the wizard background show through proportionally
                          SizedBox(height: screenHeight * 0.4),
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
          ],
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
          color: AppColors.cardBackground.withOpacity(0.8),
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
        color: AppColors.cardBackground.withOpacity(0.8),
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
