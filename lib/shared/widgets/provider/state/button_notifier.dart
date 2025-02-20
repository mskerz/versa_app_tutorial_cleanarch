

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonNotifier extends StateNotifier<int> {
  ButtonNotifier() : super(0); // Default to -1 (no button selected)

  // Method to update the selected button index
  void selectButton(int index) {
    state = index;
  }
}

