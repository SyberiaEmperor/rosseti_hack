import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputField extends StatefulWidget {
  final String initialValue;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final Function(String) onChanged;
  final String name;
  final Function(String) validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String) onFieldSubmitted;
  final bool obscureText;
  final Color errorColor;

  const InputField(
      {Key key,
      this.validator,
      this.errorColor = Colors.red,
      this.initialValue,
      this.focusNode,
      this.onChanged,
      this.nextFocusNode,
      this.name,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.sentences,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.obscureText = false})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isValueValid;
  @override
  void initState() {
    _isValueValid = widget.validator == null
        ? true
        : widget.validator(widget.initialValue) || widget.initialValue.isEmpty;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _adaptationHeight(double mySize) {
      return MediaQuery.of(context).size.height * (mySize / 740);
    }

    double _adaptationWidth(double myWidth) {
      return MediaQuery.of(context).size.width * (myWidth / 360);
    }

    return Container(
      height: _adaptationHeight(52),
      width: _adaptationWidth(320),
      padding: EdgeInsets.only(left: _adaptationWidth(12)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: _isValueValid
              ? Colors.black54
              : widget.errorColor, //valid and invalid colors
          width: 1,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Form(
          child: TextFormField(
            initialValue: widget.initialValue,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              color: Colors.black,
              fontSize: 16,
            ),
            focusNode: widget.focusNode,
            onFieldSubmitted: (_) {
              if (widget.onFieldSubmitted != null)
                widget.onFieldSubmitted(_);
              else {
                if (widget.nextFocusNode != null)
                  widget.nextFocusNode.requestFocus();
              }
            },
            cursorColor: Theme.of(context).accentColor,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                color: Colors.black38,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontSize: 16,
              ),
              border: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              hintText: widget.name,
            ),
            obscureText: widget.obscureText,
            textCapitalization: widget.textCapitalization,
            textInputAction: widget.textInputAction,
            onChanged: (value) {
              if (widget.validator != null) {
                setState(() {
                  _isValueValid =
                      widget.validator(value) || value.trim().isEmpty;
                });
              }
              widget.onChanged(value);
            },
          ),
        ),
      ),
    );
  }
}
