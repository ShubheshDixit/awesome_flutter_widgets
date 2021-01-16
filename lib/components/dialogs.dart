import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ImageDialog extends StatefulWidget {
  final Widget image;
  final double titleSize;
  final double bodySize;
  final Widget bodyWidget;
  final String title;
  final double width;
  final double height;
  final BoxFit imageFit;
  final Color imageBGColor;
  final Color backgroundColor;
  final Color titleColor;
  final EdgeInsets imagePadding;
  final Color bodyColor;
  final String fontFamily;
  final double imageWidth;
  final Color actionColor;
  final Color cancelColor;
  final Color actionTextColor;
  final double borderRadius;
  final String bodyText;
  final double imageHeight;
  final TextAlign textAlign;
  final String actionText;
  final CrossAxisAlignment contentAlignment;
  final BorderRadius imageRadius;
  final bool isCentered;
  final bool isActionsExpanded;
  final onActionPressed;
  final MainAxisAlignment actionsAlignment;
  final Widget actionWidget;
  final EdgeInsets actionPadding;
  final Color actionsBGColor;
  final List<Widget> actions;
  final double actionFontSize;
  final Widget header;
  final bool removeCancel;
  final String labelText;
  final Widget labelWidget;
  final Color labelColor;

  const ImageDialog(
      {Key key,
      this.isActionsExpanded = false,
      this.width,
      this.labelColor,
      this.labelText,
      this.labelWidget,
      this.header,
      this.actionsBGColor,
      this.actionWidget,
      this.height,
      this.actionFontSize,
      this.actionsAlignment,
      this.actions,
      this.imageFit = BoxFit.cover,
      this.textAlign,
      this.fontFamily,
      this.actionTextColor,
      this.imageWidth,
      this.contentAlignment = CrossAxisAlignment.center,
      this.borderRadius = 5.0,
      this.imagePadding,
      @required this.image,
      this.imageRadius,
      this.imageBGColor,
      this.backgroundColor,
      this.isCentered = false,
      this.actionColor,
      this.bodyColor,
      this.cancelColor,
      this.removeCancel = false,
      this.titleColor,
      this.titleSize,
      this.bodySize,
      this.bodyWidget,
      this.title,
      this.actionPadding,
      this.bodyText,
      this.imageHeight,
      this.actionText,
      this.onActionPressed})
      : assert(image != null),
        super(key: key);

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: SingleChildScrollView(
          child: Container(
            width: widget.width ?? 400,
            height: widget.height,
            color: widget.backgroundColor ??
                Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  widget.contentAlignment ?? CrossAxisAlignment.center,
              children: [
                !widget.isCentered
                    ? Container(
                        height: widget.imageHeight ?? 150,
                        width: widget.imageWidth ??
                            MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: widget.imageFit != BoxFit.contain
                            ? widget.imagePadding ?? EdgeInsets.zero
                            : EdgeInsets.zero,
                        decoration: BoxDecoration(
                            color: widget.imageBGColor ?? Colors.transparent),
                        child: ClipRRect(
                          borderRadius:
                              widget.imageRadius ?? BorderRadius.circular(0),
                          child: Container(
                              padding:
                                  widget.imagePadding ?? EdgeInsets.all(0.0),
                              child: widget.image),
                        ),
                      )
                    : SizedBox.shrink(),
                widget.isCentered
                    ? Container(
                        height: widget.imageHeight ?? 150,
                        width: widget.imageWidth,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        child: ClipRRect(
                          borderRadius:
                              widget.imageRadius ?? BorderRadius.circular(0),
                          child: Container(
                            padding: widget.imageFit == BoxFit.contain
                                ? widget.imagePadding ?? EdgeInsets.all(10)
                                : widget.imagePadding ?? EdgeInsets.zero,
                            color: widget.imageBGColor,
                            child: widget.image,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    widget.title ?? 'Title',
                    textAlign: widget.textAlign ?? TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.titleSize ?? 22,
                      fontWeight: FontWeight.w900,
                      color: widget.titleColor,
                      fontFamily: widget.fontFamily,
                    ),
                  ),
                ),
                widget.bodyWidget ?? widget.bodyText != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          widget.bodyText ?? 'Subtile of this dialog',
                          textAlign: widget.textAlign ?? TextAlign.center,
                          style: TextStyle(
                            fontSize: widget.bodySize ?? 18,
                            color: widget.bodyColor,
                            height: 1.3,
                            fontFamily: widget.fontFamily,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                widget.actionWidget ??
                    Container(
                      color: widget.actionsBGColor ??
                          Colors.black.withOpacity(0.1),
                      margin: EdgeInsets.only(top: 8),
                      padding: widget.actionPadding ?? EdgeInsets.all(10),
                      child: widget.isActionsExpanded
                          ? Row(
                              children: widget.actions ??
                                  [
                                    widget.removeCancel
                                        ? SizedBox.shrink()
                                        : Expanded(child: _buildCancleButton()),
                                    widget.removeCancel
                                        ? SizedBox.shrink()
                                        : SizedBox(
                                            width: 20,
                                          ),
                                    Expanded(
                                      child: _buildActionButton(),
                                    )
                                  ],
                            )
                          : Row(
                              mainAxisAlignment: widget.actionsAlignment ??
                                  MainAxisAlignment.spaceBetween,
                              children: widget.actions ??
                                  [
                                    widget.removeCancel
                                        ? SizedBox.shrink()
                                        : _buildCancleButton(),
                                    widget.actionsAlignment ==
                                            MainAxisAlignment.spaceEvenly
                                        ? SizedBox.shrink()
                                        : SizedBox(
                                            width: 10,
                                          ),
                                    _buildActionButton(),
                                  ],
                            ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCancleButton() {
    return Container(
      height: 40,
      child: OutlineButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        borderSide: BorderSide(
          color: widget.cancelColor ??
              widget.actionColor ??
              Theme.of(context).primaryColor,
        ),
        highlightedBorderColor: widget.cancelColor ??
            widget.actionColor ??
            Theme.of(context).primaryColor,
        textColor: widget.cancelColor ??
            widget.actionColor ??
            Theme.of(context).primaryColor,
        icon: Icon(
          FontAwesomeIcons.timesCircle,
          size: widget.actionFontSize ?? 18,
          color: widget.cancelColor ??
              widget.actionColor ??
              Theme.of(context).primaryColor,
        ),
        label: Text(
          'Cancle',
          style: TextStyle(
            color: widget.cancelColor,
            fontFamily: widget.fontFamily,
            fontSize: widget.actionFontSize ?? 18,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      height: 40,
      child: RaisedButton.icon(
        color: widget.actionColor ?? Theme.of(context).primaryColor,
        onPressed: widget.onActionPressed ?? () => Navigator.pop(context),
        icon: Icon(FontAwesomeIcons.checkCircle,
            size: widget.actionFontSize ?? 18,
            color: widget.actionTextColor ?? Colors.white),
        label: Text(
          widget.actionText ?? 'Done',
          style: TextStyle(
              color: widget.actionTextColor ?? Colors.white,
              fontFamily: widget.fontFamily,
              fontSize: widget.actionFontSize ?? 18),
        ),
      ),
    );
  }
}

class IconDialog extends StatefulWidget {
  @required
  final IconData icon;
  final double width;
  final Color iconColor;
  final double height;
  final double titleSize;
  final double bodySize;
  final Widget bodyWidget;
  final String title;
  final Color iconBGColor;
  final Color backgroundColor;
  final Color titleColor;
  final EdgeInsets iconPadding;
  final Color bodyColor;
  final String fontFamily;
  final double iconSize;
  final Color actionColor;
  final Color cancelColor;
  final Color actionTextColor;
  final double borderRadius;
  final String bodyText;
  final TextAlign textAlign;
  final String actionText;
  final CrossAxisAlignment contentAlignment;
  final double iconsBGRadius;
  final bool isActionsExpanded;
  final onActionPressed;
  final MainAxisAlignment actionsAlignment;
  final Widget actionWidget;
  final EdgeInsets actionPadding;
  final double actionsFontSize;
  final List<Widget> actions;

  const IconDialog(this.icon, this.title,
      {Key key,
      this.width,
      this.actions,
      this.iconColor,
      this.height,
      this.titleSize,
      this.bodySize,
      this.actionsFontSize,
      this.bodyWidget,
      this.iconBGColor,
      this.backgroundColor,
      this.titleColor,
      this.iconPadding,
      this.bodyColor,
      this.fontFamily,
      this.iconSize,
      this.actionColor,
      this.cancelColor,
      this.actionTextColor,
      this.borderRadius,
      this.bodyText,
      this.textAlign,
      this.actionText,
      this.contentAlignment,
      this.iconsBGRadius,
      this.isActionsExpanded = false,
      this.onActionPressed,
      this.actionsAlignment,
      this.actionWidget,
      this.actionPadding})
      : super(key: key);

  @override
  _IconDialogState createState() => _IconDialogState();
}

class _IconDialogState extends State<IconDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 0.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 5.0),
        child: Container(
          width: widget.width ?? 400,
          height: widget.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:
                  widget.contentAlignment ?? CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(widget.iconsBGRadius ?? 0.0),
                    child: Container(
                      padding: widget.iconPadding ?? EdgeInsets.zero,
                      color: widget.iconBGColor ?? Colors.transparent,
                      child: Icon(
                        widget.icon ?? Icons.info,
                        color: widget.iconColor ?? Colors.black,
                        size: widget.iconSize ?? 50,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Text(
                    widget.title ?? 'Title',
                    textAlign: widget.textAlign ?? TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.titleSize ?? 22,
                      fontWeight: FontWeight.w900,
                      color: widget.titleColor,
                      fontFamily: widget.fontFamily,
                    ),
                  ),
                ),
                widget.bodyWidget ??
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 5.0),
                      child: Text(
                        widget.bodyText ?? 'Subtile of this dialog',
                        textAlign: widget.textAlign ?? TextAlign.center,
                        style: TextStyle(
                          fontSize: widget.bodySize ?? 18,
                          color: widget.bodyColor,
                          fontFamily: widget.fontFamily,
                        ),
                      ),
                    ),
                widget.actionWidget ??
                    Container(
                      color: Colors.black.withOpacity(0.2),
                      margin: EdgeInsets.only(top: 10),
                      padding: widget.actionPadding ?? EdgeInsets.all(10),
                      child: widget.isActionsExpanded
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(child: _buildCancleButton()),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: _buildActionButton(),
                                )
                              ],
                            )
                          : Row(
                              mainAxisAlignment: widget.actionsAlignment ??
                                  MainAxisAlignment.end,
                              children: [
                                _buildCancleButton(),
                                SizedBox(
                                  width: 10,
                                ),
                                _buildActionButton(),
                              ],
                            ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCancleButton() {
    return Container(
      height: 40,
      child: OutlineButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        borderSide: BorderSide(
          color: widget.cancelColor ??
              widget.actionColor ??
              Theme.of(context).primaryColor,
        ),
        highlightedBorderColor: widget.cancelColor ??
            widget.actionColor ??
            Theme.of(context).primaryColor,
        textColor: widget.cancelColor ??
            widget.actionColor ??
            Theme.of(context).primaryColor,
        icon: Icon(
          Icons.cancel,
          color: widget.cancelColor ??
              widget.actionColor ??
              Theme.of(context).primaryColor,
        ),
        label: Text(
          'Cancle',
          style: TextStyle(
            color: widget.cancelColor,
            fontFamily: widget.fontFamily,
            fontSize: widget.actionsFontSize,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return Container(
      height: 40,
      child: RaisedButton.icon(
        color: widget.actionColor ?? Theme.of(context).primaryColor,
        onPressed: widget.onActionPressed ?? () {},
        icon: Icon(Icons.check_circle,
            color: widget.actionTextColor ?? Colors.white),
        label: Text(
          widget.actionText ?? 'Done',
          style: TextStyle(
            color: widget.actionTextColor ?? Colors.white,
            fontFamily: widget.fontFamily,
            fontSize: widget.actionsFontSize,
          ),
        ),
      ),
    );
  }
}

class CustomChildDialog extends StatelessWidget {
  @required
  final Widget labelchild;
  final String labelText;
  final double width;
  final Color iconColor;
  final double height;
  final double titleSize;
  final double bodySize;
  final Widget bodyWidget;
  final String title;
  final Color iconBGColor;
  final Color backgroundColor;
  final Color titleColor;
  final EdgeInsets iconPadding;
  final Color bodyColor;
  final String fontFamily;
  final double iconSize;
  final Color actionColor;
  final Color cancelColor;
  final Color actionTextColor;
  final double borderRadius;
  final String bodyText;
  final TextAlign textAlign;
  final String actionText;
  final CrossAxisAlignment contentAlignment;
  final double iconsBGRadius;
  final bool isActionsExpanded;
  final double topChildHeight;
  final onActionPressed;
  final MainAxisAlignment actionsAlignment;
  final Widget actionWidget;
  final EdgeInsets actionPadding;
  final double actionsFontSize;
  final Widget topChild;
  final double topChildWidth;

  const CustomChildDialog(this.title,
      {Key key,
      this.labelText,
      this.labelchild,
      this.width,
      this.topChild,
      this.iconColor,
      this.height,
      this.topChildWidth,
      this.titleSize,
      this.topChildHeight = 150,
      this.bodySize,
      this.actionsFontSize,
      this.bodyWidget,
      this.iconBGColor,
      this.backgroundColor,
      this.titleColor,
      this.iconPadding,
      this.bodyColor,
      this.fontFamily,
      this.iconSize,
      this.actionColor,
      this.cancelColor,
      this.actionTextColor,
      this.borderRadius,
      this.bodyText,
      this.textAlign,
      this.actionText,
      this.contentAlignment,
      this.iconsBGRadius,
      this.isActionsExpanded = false,
      this.onActionPressed,
      this.actionsAlignment,
      this.actionWidget,
      this.actionPadding})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      child: Stack(
        children: [
          Container(
            width: width ?? 400,
            height: height,
            margin: EdgeInsets.only(
                top: topChild == null
                    ? 0
                    : topChildHeight != null
                        ? (topChildHeight / 2)
                        : 0.0),
            color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    contentAlignment ?? CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    height: topChild == null
                        ? 60
                        : (topChildHeight != null ? (topChildHeight / 2) : 20) +
                            10.0,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: labelchild == null && labelText == null
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: labelchild ?? labelText == null
                              ? SizedBox.shrink()
                              : Text(
                                  labelText,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleSize ?? 22,
                                  ),
                                ),
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 30,
                              color: Colors.grey,
                            ),
                            onPressed: () => Navigator.pop(context)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 5.0),
                    child: Text(
                      title ?? 'Title',
                      textAlign: textAlign ?? TextAlign.center,
                      style: TextStyle(
                        fontSize: titleSize ?? 22,
                        fontWeight: FontWeight.w900,
                        color: titleColor,
                        fontFamily: fontFamily,
                      ),
                    ),
                  ),
                  bodyWidget ??
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5.0),
                        child: Text(
                          bodyText ?? 'Subtile of this dialog',
                          textAlign: textAlign ?? TextAlign.center,
                          style: TextStyle(
                            fontSize: bodySize ?? 18,
                            color: bodyColor,
                            fontFamily: fontFamily,
                          ),
                        ),
                      ),
                  actionWidget ??
                      Container(
                        color: Colors.black.withOpacity(0.2),
                        margin: EdgeInsets.only(top: 10),
                        padding: actionPadding ?? EdgeInsets.all(10),
                        child: isActionsExpanded
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: _buildCancleButton(context)),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: _buildActionButton(context),
                                  )
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    actionsAlignment ?? MainAxisAlignment.end,
                                children: [
                                  _buildCancleButton(context),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  _buildActionButton(context),
                                ],
                              ),
                      ),
                ],
              ),
            ),
          ),
          topChild == null
              ? SizedBox.shrink()
              : Positioned(
                  left: 10.0,
                  right: 10.0,
                  child: Center(
                    child: Container(
                      height: topChildHeight ?? 150,
                      width: topChildWidth ?? 350,
                      child: topChild != null
                          ? topChild ??
                              CircleAvatar(
                                backgroundColor: Colors.deepOrange,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              )
                          : SizedBox.shrink(),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildCancleButton(context) {
    return Container(
      height: 40,
      child: OutlineButton.icon(
        onPressed: () {
          Navigator.pop(context);
        },
        borderSide: BorderSide(
          color: cancelColor ?? actionColor ?? Theme.of(context).primaryColor,
        ),
        highlightedBorderColor:
            cancelColor ?? actionColor ?? Theme.of(context).primaryColor,
        textColor: cancelColor ?? actionColor ?? Theme.of(context).primaryColor,
        icon: Icon(
          Icons.cancel,
          color: cancelColor ?? actionColor ?? Theme.of(context).primaryColor,
        ),
        label: Text(
          'Cancle',
          style: TextStyle(
            color: cancelColor,
            fontFamily: fontFamily,
            fontSize: actionsFontSize,
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(context) {
    return Container(
      height: 40,
      child: RaisedButton.icon(
        color: actionColor ?? Theme.of(context).primaryColor,
        onPressed: onActionPressed ?? () {},
        icon: Icon(Icons.check_circle, color: actionTextColor ?? Colors.white),
        label: Text(
          actionText ?? 'Done',
          style: TextStyle(
            color: actionTextColor ?? Colors.white,
            fontFamily: fontFamily,
            fontSize: actionsFontSize,
          ),
        ),
      ),
    );
  }
}
