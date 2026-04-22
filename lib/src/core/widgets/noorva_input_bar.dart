import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class NoorvaInputBar extends StatelessWidget {
  const NoorvaInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            style: const TextStyle(color: Colors.white, fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Ask Noorva Anything',
              hintStyle: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
              ),
              border: InputBorder.none,
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 4),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildIconButton(Icons.attach_file),
              const SizedBox(width: 8),
              _buildGuideButton(),
              const Spacer(),
              _buildIconButton(Icons.mic),
              const SizedBox(width: 8),
              _buildIconButton(Icons.graphic_eq),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color(0xFF262626),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 20, color: Colors.white),
    );
  }

  Widget _buildGuideButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF262626),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: const [
          Icon(Icons.lightbulb_outline, size: 20, color: Colors.white),
          SizedBox(width: 8),
          Text(
            'Guide',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down, size: 20, color: Colors.white),
        ],
      ),
    );
  }
}
