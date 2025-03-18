import 'package:flutter_riverpod/flutter_riverpod.dart';

/// NOTE: Here, we establish our little State manager to handle the counter of our application
final counterProvider = StateProvider<int>((ref) => 5);
