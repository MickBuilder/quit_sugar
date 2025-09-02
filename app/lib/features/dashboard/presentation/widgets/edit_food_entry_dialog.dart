import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';
import 'package:quit_suggar/core/theme/app_theme.dart';

class EditFoodEntryDialog extends StatefulWidget {
  final FoodEntry entry;
  final Function(double? portionGrams, double? sugarAmount) onSave;

  const EditFoodEntryDialog({
    super.key,
    required this.entry,
    required this.onSave,
  });

  @override
  State<EditFoodEntryDialog> createState() => _EditFoodEntryDialogState();
}

class _EditFoodEntryDialogState extends State<EditFoodEntryDialog> {
  late TextEditingController _portionController;
  late TextEditingController _sugarController;
  bool _isManualEntry = false;

  @override
  void initState() {
    super.initState();
    _portionController = TextEditingController(
      text: widget.entry.portionGrams.toStringAsFixed(1),
    );
    _sugarController = TextEditingController(
      text: widget.entry.sugarAmount.toStringAsFixed(1),
    );
    _isManualEntry = widget.entry.product.barcode.startsWith('manual_');
  }

  @override
  void dispose() {
    _portionController.dispose();
    _sugarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Edit ${widget.entry.displayName}'),
      content: Column(
        children: [
          const SizedBox(height: 16),
          
          // Portion size field (always editable)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Portion Size (grams)',
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: _portionController,
                keyboardType: TextInputType.number,
                placeholder: 'Enter portion size',
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.borderDefault),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Sugar amount field (only for manual entries)
          if (_isManualEntry) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sugar Amount (grams)',
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                CupertinoTextField(
                  controller: _sugarController,
                  keyboardType: TextInputType.number,
                  placeholder: 'Enter sugar amount',
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.borderDefault),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ],
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: _handleSave,
          isDefaultAction: true,
          child: const Text('Save'),
        ),
      ],
    );
  }

  void _handleSave() {
    final portionGrams = double.tryParse(_portionController.text);
    final sugarAmount = _isManualEntry ? double.tryParse(_sugarController.text) : null;
    
    if (portionGrams != null && portionGrams > 0) {
      if (_isManualEntry && sugarAmount != null && sugarAmount >= 0) {
        // For manual entries, both portion and sugar amount are editable
        widget.onSave(portionGrams, sugarAmount);
      } else if (!_isManualEntry) {
        // For scanned products, only portion size is editable
        // Sugar amount will be recalculated based on portion
        widget.onSave(portionGrams, null);
      } else {
        // Show error for invalid manual entry
        _showError('Please enter valid values');
        return;
      }
      Navigator.of(context).pop();
    } else {
      _showError('Please enter a valid portion size');
    }
  }

  void _showError(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Invalid Input'),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
