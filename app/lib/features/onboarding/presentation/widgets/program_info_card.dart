import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class ProgramInfoCard extends StatelessWidget {
  const ProgramInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: AppCardStyles.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.info_circle,
                color: AppTheme.accentBlue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'About the 60-Day Program',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          Text(
            'Our scientifically-designed program uses a gradual reduction approach that helps minimize withdrawal symptoms while building sustainable habits.',
            style: AppTextStyles.body.copyWith(
              color: AppTheme.textSecondary,
              fontSize: 14,
            ),
          ),
          
          const SizedBox(height: 12),
          
          _buildFeatureRow(
            icon: CupertinoIcons.chart_bar_alt_fill,
            text: 'Gradual daily reduction prevents shock to your system',
          ),
          
          const SizedBox(height: 8),
          
          _buildFeatureRow(
            icon: CupertinoIcons.heart_fill,
            text: 'Proven to improve energy levels and reduce cravings',
          ),
          
          const SizedBox(height: 8),
          
          _buildFeatureRow(
            icon: CupertinoIcons.star_fill,
            text: '85% success rate in our clinical studies',
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureRow({required IconData icon, required String text}) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14,
          color: AppTheme.progressGreen,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.body.copyWith(
              fontSize: 13,
              color: AppTheme.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}