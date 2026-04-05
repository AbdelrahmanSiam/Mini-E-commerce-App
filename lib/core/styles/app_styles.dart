import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/theme/app_colors.dart';

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  final double width = MediaQuery.sizeOf(context).width;
  final double scaleFactor = width / 360;
  final double responsiveFontSize = fontSize * scaleFactor;

  return responsiveFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

abstract class AppStyles {
  static TextStyle appNameBold32(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 32),
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.primary,
    letterSpacing: 1.2,
    fontFamily: "Montserrat",
  );

  static TextStyle taglineRegular11(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 11),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).hintColor,
    letterSpacing: 3.0,
    fontFamily: "Montserrat",
  );

  static TextStyle bodyMediumRegular14(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 14),
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    fontFamily: "Montserrat",
  );

  static TextStyle bodySmallRegular12(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 12),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).hintColor,
  );

  static TextStyle labelSemiBold13(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 13),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );

  static TextStyle priceBold16(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.primary,
  );

  static TextStyle statValueBold24(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 24),
    fontWeight: FontWeight.w700,
    color: Theme.of(context).colorScheme.onSurface,
  );
  static TextStyle textPrimary20(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFamily: "Montserrat",
  );

  static TextStyle buttonSemiBold15(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 15),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onPrimary,
  );

  static TextStyle errorTextRegular11(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 11),
    fontWeight: FontWeight.w400,
    color: Theme.of(context).colorScheme.error,
  );

  static TextStyle sectionTitleSemiBold16(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 16),
    fontWeight: FontWeight.w600,
    color: Theme.of(context).colorScheme.onSurface,
  );
}
