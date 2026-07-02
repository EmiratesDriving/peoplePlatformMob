import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

void showAppToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle_outline, color: AppColors.goodText),
          const SizedBox(width: 10),
          Expanded(child: Text(message)),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.panel3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 2),
    ),
  );
}

class AppPage extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? trailing;
  final Color backgroundColor;
  final bool future;

  const AppPage({
    super.key,
    required this.title,
    required this.child,
    this.subtitle,
    this.trailing,
    this.backgroundColor = AppColors.appBackground,
    this.future = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(
                  color: future ? AppColors.futureMuted : AppColors.text3,
                  fontSize: 10,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        actions: [if (trailing != null) Center(child: trailing!), const SizedBox(width: 12)],
      ),
      body: child,
    );
  }
}

class ScreenPad extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const ScreenPad({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 28),
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(padding: padding, child: child),
    );
  }
}

class EMCCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final Color borderColor;
  final double radius;

  const EMCCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(15),
    this.backgroundColor = AppColors.panel,
    this.borderColor = AppColors.line,
    this.radius = 14,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: borderColor),
      ),
      child: child,
    );

    if (onTap == null) return card;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: card,
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double height;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppGradients.brand,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 17),
          label: Text(text),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.buttonText,
            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900, fontFamily: 'Aptos'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}

class GhostButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final double height;
  final Color? foregroundColor;

  const GhostButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.height = 46,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon == null ? const SizedBox.shrink() : Icon(icon, size: 17),
        label: Text(text),
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor ?? AppColors.text,
          side: const BorderSide(color: AppColors.line),
          textStyle: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w800, fontFamily: 'Aptos'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 10, 2, 9),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          color: AppColors.text3,
          fontSize: 11,
          letterSpacing: 1.4,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class Stat3 extends StatelessWidget {
  final List<StatItem> items;

  const Stat3({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items
          .map(
            (item) => Expanded(
              child: Container(
                margin: EdgeInsets.only(right: item == items.last ? 0 : 8),
                padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.panel2,
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Column(
                  children: [
                    Text(item.value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 2),
                    Text(item.label, style: const TextStyle(fontSize: 10.5, color: AppColors.text2)),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

class StatItem {
  final String value;
  final String label;

  const StatItem(this.value, this.label);
}

enum PillType { info, good, warn, bad, future }

class InfoPill extends StatelessWidget {
  final String text;
  final PillType type;

  const InfoPill(this.text, {super.key, this.type = PillType.info});

  @override
  Widget build(BuildContext context) {
    final colors = switch (type) {
      PillType.good => (AppColors.goodBg, AppColors.goodText),
      PillType.warn => (AppColors.warnBg, AppColors.warn),
      PillType.bad => (AppColors.badBg, AppColors.badText),
      PillType.future => (AppColors.futureBg, AppColors.futureText),
      PillType.info => (AppColors.cyan.withOpacity(.12), AppColors.cyan),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(color: colors.$1, borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(color: colors.$2, fontSize: 11, fontWeight: FontWeight.w800)),
    );
  }
}

class ListRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool future;

  const ListRow({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
    this.future = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(color: AppColors.panel2, borderRadius: BorderRadius.circular(10)),
              child: Icon(icon, color: future ? AppColors.future : AppColors.cyan, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.text2)),
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class FieldLabel extends StatelessWidget {
  final String text;

  const FieldLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(text, style: const TextStyle(color: AppColors.text2, fontSize: 12)),
    );
  }
}

class FormFieldBlock extends StatelessWidget {
  final String label;
  final Widget child;

  const FormFieldBlock({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [FieldLabel(label), child]),
    );
  }
}

class NoteBox extends StatelessWidget {
  final String text;

  const NoteBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: const BoxDecoration(
        color: AppColors.panel2,
        border: Border(left: BorderSide(color: AppColors.cyan, width: 3)),
        borderRadius: BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
      ),
      child: Text(text, style: const TextStyle(color: AppColors.text2, fontSize: 12, height: 1.55)),
    );
  }
}

class FutureBanner extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const FutureBanner({
    super.key,
    required this.title,
    required this.description,
    this.icon = Icons.info_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.futureBg,
        border: Border.all(color: AppColors.futureBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.future, size: 19),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.futureText, fontSize: 13, fontWeight: FontWeight.w900)),
                const SizedBox(height: 3),
                Text(description, style: const TextStyle(color: AppColors.futureMuted, fontSize: 12, height: 1.5)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
