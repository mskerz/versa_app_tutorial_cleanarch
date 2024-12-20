
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenTabStateNotifier extends StateNotifier <int>{
  TokenTabStateNotifier() : super(0);

  void changeTab(int index){
    state = index;
  }

}