// lib/features/dashboard/presentation/screens/dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ConsumerWidget is a StatefulWidget from Riverpod for listening to providers
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We will use 'ref' later to interact with our providers
    
    // Placeholder data for the UI
    final double currentSugar = 14.0;
    final double dailyGoal = 25.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Today\'s Sugar'),
        centerTitle: true,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // The main visual progress indicator
            _buildSugarProgress(context, currentSugar, dailyGoal),
            
            const SizedBox(height: 24),

            // A placeholder for the list of scanned items
            const Text(
              'Logged Items',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Scan your first item to begin!',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to the barcode scanner screen
          print('Scanner button tapped!');
        },
        tooltip: 'Scan Product',
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  // Helper widget for the progress circle
  Widget _buildSugarProgress(BuildContext context, double current, double goal) {
    final double percentage = (current / goal).clamp(0.0, 1.0);
    
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                value: percentage,
                strokeWidth: 12,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${current.toStringAsFixed(0)}g',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'of ${goal.toStringAsFixed(0)}g',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}