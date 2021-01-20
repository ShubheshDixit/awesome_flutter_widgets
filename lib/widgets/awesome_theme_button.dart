import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AwesomeThemeButton extends StatefulWidget {
  final bool value;
  final Function(bool value) onChanged;
  final Duration duration;
  final Color selectedButtonColor,
      unselectedButtonColor,
      selectedBorderColor,
      unselectedBorderColor;
  final IconData selectedIcon, unselectedIcon;
  final double headerSize;
  final bool hideBodyIcon;

  const AwesomeThemeButton({
    Key key,
    @required this.value,
    @required this.onChanged,
    this.duration,
    this.selectedButtonColor,
    this.unselectedButtonColor,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedIcon = FontAwesomeIcons.solidSun,
    this.unselectedIcon = FontAwesomeIcons.solidMoon,
    this.headerSize = 40,
    this.hideBodyIcon = false,
  }) : super(key: key);
  @override
  _AwesomeThemeButtonState createState() => _AwesomeThemeButtonState();
}

class _AwesomeThemeButtonState extends State<AwesomeThemeButton>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          widget.hideBodyIcon ? widget.headerSize * 1.5 : widget.headerSize * 2,
      height: widget.headerSize,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: widget.duration ?? Duration(milliseconds: 300),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: widget.value
                        ? widget.selectedBorderColor ??
                            Theme.of(context).primaryColor
                        : widget.unselectedBorderColor ?? Colors.grey,
                    width: 3.0),
              ),
              height: widget.headerSize - 10,
              width: (widget.headerSize + widget.headerSize / 2),
              child: widget.hideBodyIcon
                  ? SizedBox.shrink()
                  : AnimatedPadding(
                      duration:
                          widget.duration ?? const Duration(milliseconds: 300),
                      padding: EdgeInsets.only(
                          left: widget.value ? 0 : widget.headerSize / 2,
                          right: widget.value ? widget.headerSize / 2 : 0),
                      child: Icon(
                        widget.value
                            ? widget.selectedIcon
                            : widget.unselectedIcon,
                        size: widget.headerSize / 2,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      ),
                    ),
            ),
          ),
          AnimatedAlign(
            alignment:
                widget.value ? Alignment.centerRight : Alignment.centerLeft,
            duration: widget.duration ?? Duration(milliseconds: 300),
            curve: Curves.easeIn,
            child: AnimatedContainer(
              duration: widget.duration ?? Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: widget.value
                      ? widget.selectedButtonColor ??
                          Theme.of(context).primaryColor
                      : widget.unselectedButtonColor ??
                          Theme.of(context).accentColor,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 1,
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.2),
                    )
                  ]),
              height: widget.headerSize,
              width: widget.headerSize,
              child: IconButton(
                splashRadius: widget.headerSize / 2 + 10,
                padding: EdgeInsets.only(bottom: 3.0),
                icon: Icon(
                  !widget.value ? widget.selectedIcon : widget.unselectedIcon,
                  color: Colors.white,
                  size: widget.headerSize / 2 + widget.headerSize / 8,
                ),
                onPressed: () {
                  // Timer(widget.duration ?? Duration(milliseconds: 300),
                  //     () => widget.onChanged(!(widget.value)));
                  widget.onChanged(!(widget.value));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
