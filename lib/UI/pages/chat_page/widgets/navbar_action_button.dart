import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';

class NavbarActionButton extends StatelessWidget {
  final Color color;
  final VoidCallback action;
  final bool isIcon;
  final IconData icon;
  final String text;
  final Color childColor;

  NavbarActionButton({
    this.color,
    @required this.action,
    @required this.isIcon,
    this.icon,
    this.childColor,
    this.text,
  }) : assert(isIcon
            ? text == null && icon != null
            : icon == null && text != null);
  @override
  Widget build(BuildContext context) {
    var content = isIcon
        ? Icon(
            icon,
            color: childColor,
            size: ResponsiveSize.height(25),
          )
        : Text(
            text,
            style: TextStyle(
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: childColor,
              fontSize: ResponsiveSize.height(24),
            ),
          );
    return GestureDetector(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        height: ResponsiveSize.height(40),
        width: ResponsiveSize.width(40),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: content,
      ),
    );
  }
}
