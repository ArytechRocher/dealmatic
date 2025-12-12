import 'package:flutter/material.dart';

enum AppButtonType { primary, secondary, ghost }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color background;
    Color foreground;

    switch (type) {
      case AppButtonType.primary:
        background = theme.colorScheme.primary;
        foreground = theme.colorScheme.onPrimary;
        break;
      case AppButtonType.secondary:
        background = Colors.transparent;
        foreground = theme.colorScheme.primary;
        break;
      case AppButtonType.ghost:
        background = Colors.transparent;
        foreground = theme.colorScheme.primary;
        break;
    }

    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: type == AppButtonType.primary ? background : Colors.transparent,
          foregroundColor: foreground,
          side: type == AppButtonType.secondary
              ? BorderSide(color: theme.colorScheme.primary, width: 1.4)
              : null,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: type == AppButtonType.primary ? 2 : 0,
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20),
                    const SizedBox(width: 8),
                  ],
                  Text(label),
                ],
              ),
      ),
    );
  }
}
