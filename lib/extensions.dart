import 'package:booking_bloc/theme/theme.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  CustomColors get color => AppTheme.appColors;
  ThemeData get theme => Theme.of(this);
  double get adaptiveWidth => MediaQuery.of(this).size.width;
}
