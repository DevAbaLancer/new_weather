import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String errorText;
  final Color themeColor;
  final Color errorColor;
  final Color backgroundColor;
  final TextEditingController myController;
  final TextStyle floatingTextStyle;
  final TextStyle labelTextStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onSaved;
  final bool obscureText;

  final int maxlines;
  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.errorText,
      required this.backgroundColor,
      required this.errorColor,
      required this.themeColor,
      required this.myController,
      required this.floatingTextStyle,
      required this.labelTextStyle,
      this.obscureText = false,
      this.maxlines = 1,
      this.validator,
      this.onSaved})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final customThemeText = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: TextFormField(
            obscureText: obscureText,
            textAlign: TextAlign.justify,
            maxLines: maxlines,
            validator: validator,
            controller: myController,
            onChanged: onSaved,
            style: labelTextStyle,
            cursorColor: themeColor,
            cursorWidth: 1.0,
            decoration: InputDecoration(
              fillColor: backgroundColor,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              labelText: labelText,
              labelStyle: labelTextStyle,
              alignLabelWithHint: true,
              floatingLabelStyle: floatingTextStyle,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: themeColor,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: themeColor,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: errorColor,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: errorColor,
                  width: 1.0,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: themeColor,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
