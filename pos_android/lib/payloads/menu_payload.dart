import 'package:flutter/material.dart';

class MenuPayload {
  final String nameLocal;
  final String route;
  final String? svgPath;
  final bool? active;
  final bool? isDivider;
  final bool isDialog;
  final bool isModal;
  final Widget? page;
  final VoidCallback? onClicked;


  MenuPayload({
    required this.nameLocal,
    required this.route,
    this.svgPath,
    this.active,
    this.isDivider,
    this.isDialog = false,
    this.isModal = false,
    this.page,
    this.onClicked,
  });
}
