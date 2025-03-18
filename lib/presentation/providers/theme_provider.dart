import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

/// Changes between Light or Dark Mode
final isDarkModeProvider = StateProvider<bool>((ref) => false);

/// List of colors that can be used in the application and are immutable.
final colorListProvider = Provider((ref) => colorList);

/// NOTE: Selected color is a StateProvider because it will change the color of the whole application.
final selectedColorProvider = StateProvider<int>((ref) => 0);
