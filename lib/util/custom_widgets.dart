
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

showToast({required BuildContext context, required ToastificationType type, required String title, required String desc}) {
  Color? _primary;
  Color? _background;
  Color? _foreground;

  switch(type){
    case ToastificationType.success:
      _primary = Colors.green;
      _background = Colors.green.shade50;
      _foreground = Colors.black;
      break;

    case ToastificationType.warning:
      _primary = Colors.amber;
      _background = Color.fromARGB(203, 230, 200, 133);
      _foreground = Colors.deepPurple;
      break;

    case ToastificationType.info:
      _primary = Colors.blueAccent;
      _background = Colors.white;
      _foreground = Colors.black;
      break;

    case ToastificationType.error:
      _primary = Colors.red;
      _background = Color.fromARGB(255, 255, 110, 110);
      _foreground = Colors.white;
      break;

    default:
      break;
  }

  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 5),
    title: title,
    // you can also use RichText widget for title and description parameters
    description: desc,
    alignment: Alignment.bottomLeft,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.check),
    primaryColor: _primary,
    backgroundColor: _background,
    foregroundColor: _foreground,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
  );
}