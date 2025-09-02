import 'package:flutter/cupertino.dart';
import 'package:quit_suggar/features/tracking/domain/entities/food_entry.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final FoodEntry entry;
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({
    super.key,
    required this.entry,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete Entry'),
      content: Text(
        'Are you sure you want to delete "${entry.displayName}" (${entry.sugarAmount.toStringAsFixed(1)}g sugar)?\n\nThis action cannot be undone.',
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          isDestructiveAction: true,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
