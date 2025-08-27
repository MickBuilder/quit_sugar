import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quit_suggar/features/tracking/domain/entities/product_info.dart';
import 'package:quit_suggar/features/tracking/presentation/providers/sugar_tracking_provider.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

enum PortionType {
  quarter,
  half,
  whole,
  custom,
}

class SmartPortionSelector extends ConsumerStatefulWidget {
  final ProductInfo product;
  final double selectedPortion;
  final ValueChanged<double> onPortionChanged;

  const SmartPortionSelector({
    super.key,
    required this.product,
    required this.selectedPortion,
    required this.onPortionChanged,
  });

  @override
  ConsumerState<SmartPortionSelector> createState() => _SmartPortionSelectorState();
}

class _SmartPortionSelectorState extends ConsumerState<SmartPortionSelector> {
  PortionType _selectedType = PortionType.whole;

  @override
  void initState() {
    super.initState();
    // Initialize with whole serving but don't trigger update during build
    _selectedType = PortionType.whole;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Update the initial portion after the widget is fully built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _updatePortion();
      }
    });
  }



  double _customPercentage = 50.0;

  double _getPortionForType(PortionType type) {
    // Use the actual product weight as the base for portion calculations
    final productWeight = widget.product.weightGrams ?? widget.product.servingSize;
    
    switch (type) {
      case PortionType.quarter:
        return productWeight * 0.25;
      case PortionType.half:
        return productWeight * 0.5;
      case PortionType.whole:
        return productWeight;
      case PortionType.custom:
        return productWeight * (_customPercentage / 100.0);
    }
  }

  void _updatePortion() {
    final newPortion = _getPortionForType(_selectedType);
    widget.onPortionChanged(newPortion);
  }

  void _selectPortionType(PortionType type) {
    setState(() {
      _selectedType = type;
    });
    _updatePortion();
  }



  @override
  Widget build(BuildContext context) {
    final currentPortion = _getPortionForType(_selectedType);
    final sugarAmount = widget.product.calculateSugarForPortion(currentPortion);
    
    return ref.watch(sugarTrackingProvider).when(
      data: (tracking) {
        final summary = tracking.getDailySummary();
        final currentDailySugar = summary.totalSugar;
        final dailyLimit = summary.dailyLimit;
        final newDailyTotal = currentDailySugar + sugarAmount;
        final isOverLimit = newDailyTotal > dailyLimit;
        final isCloseToLimit = newDailyTotal > dailyLimit * 0.9;
        
        return _buildPortionSelector(
          currentPortion,
          sugarAmount,
          currentDailySugar,
          dailyLimit,
          newDailyTotal,
          isOverLimit,
          isCloseToLimit,
        );
      },
      loading: () => _buildPortionSelector(
        currentPortion,
        sugarAmount,
        0.0,
        25.0,
        sugarAmount,
        false,
        false,
      ),
      error: (_, __) => _buildPortionSelector(
        currentPortion,
        sugarAmount,
        0.0,
        25.0,
        sugarAmount,
        false,
        false,
            ),
    );
  }

  Widget _buildPortionSelector(
    double currentPortion,
    double sugarAmount,
    double currentDailySugar,
    double dailyLimit,
    double newDailyTotal,
    bool isOverLimit,
    bool isCloseToLimit,
  ) {
    return Container(
      decoration: AppCardStyles.primary,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Portion',
            style: AppTextStyles.heading.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 12),
          
          // Portion buttons in a row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPortionButton(
                PortionType.quarter,
                'Quarter',
                _selectedType == PortionType.quarter,
              ),
              _buildPortionButton(
                PortionType.half,
                'Half',
                _selectedType == PortionType.half,
              ),
              _buildPortionButton(
                PortionType.whole,
                'Whole',
                _selectedType == PortionType.whole,
              ),
              _buildPortionButton(
                PortionType.custom,
                'Custom',
                _selectedType == PortionType.custom,
              ),
            ],
          ),
          
          // Custom percentage slider (only show when custom is selected)
          if (_selectedType == PortionType.custom) ...[
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surfaceBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.borderDefault,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryBlack.withValues(alpha: 0.7),
                    blurRadius: 0,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Custom Percentage',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${_customPercentage.toStringAsFixed(0)}%',
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  CupertinoSlider(
                    value: _customPercentage,
                    min: 5.0,
                    max: 100.0,
                    divisions: 19, // 5% increments (5, 10, 15, ..., 100)
                    onChanged: (value) {
                      setState(() {
                        _customPercentage = value;
                      });
                      _updatePortion();
                    },
                    activeColor: AppTheme.primaryBlack,
                    thumbColor: AppTheme.primaryBlack,
                  ),
                ],
              ),
            ),
          ],
          
          const SizedBox(height: 16),
          
          // Sugar impact preview
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getImpactColor(isOverLimit, isCloseToLimit),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  _getImpactIcon(isOverLimit, isCloseToLimit),
                  color: AppTheme.primaryWhite,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sugar: +${sugarAmount.toStringAsFixed(1)}g',
                        style: AppTextStyles.caption.copyWith(
                          color: AppTheme.primaryWhite,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Daily: ${currentDailySugar.toStringAsFixed(1)}g → ${newDailyTotal.toStringAsFixed(1)}g/${dailyLimit.toStringAsFixed(0)}g',
                        style: AppTextStyles.caption.copyWith(
                          color: AppTheme.primaryWhite,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPortionButton(
    PortionType type,
    String label,
    bool isSelected, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () => _selectPortionType(type),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlack : AppTheme.surfaceBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppTheme.borderDefault,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlack.withValues(alpha: 0.7),
              blurRadius: 0,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            color: isSelected ? AppTheme.primaryWhite : AppTheme.textPrimary,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Color _getImpactColor(bool isOverLimit, bool isCloseToLimit) {
    if (isOverLimit) {
      return AppTheme.accentRed;
    } else if (isCloseToLimit) {
      return AppTheme.accentOrange;
    } else {
      return AppTheme.accentGreen;
    }
  }

  IconData _getImpactIcon(bool isOverLimit, bool isCloseToLimit) {
    if (isOverLimit) {
      return CupertinoIcons.exclamationmark_triangle;
    } else if (isCloseToLimit) {
      return CupertinoIcons.exclamationmark_circle;
    } else {
      return CupertinoIcons.checkmark_circle;
    }
  }
}
