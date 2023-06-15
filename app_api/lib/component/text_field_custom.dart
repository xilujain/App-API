import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      required this.hint,
      required this.label,
      required this.icon,
      this.isPassword = false,
      this.controller,
      this.onChanged,
      this.minLines = 1,
      this.maxLines = 1});

  final String hint;
  final String label;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final int minLines;
  final int maxLines;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hiddenPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        enabled: true,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword! && !hiddenPassword,
        obscuringCharacter: "*",
        cursorColor: Colors.purple,
        cursorWidth: 10,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: widget.hint,
            labelText: widget.label,
            prefixIcon: Icon(
              widget.icon,
              color: Colors.purple,
            ),
            suffixIcon: widget.isPassword!
                ? InkWell(
                    onTap: () {
                      hiddenPassword = !hiddenPassword;
                      setState(() {});
                    },
                    child: hiddenPassword == true
                        ? Icon(widget.icon, color: Colors.purple)
                        : const Icon(Icons.visibility_off,
                            color: Colors.purple))
                : null,
            labelStyle: const TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400),
            border: const OutlineInputBorder(),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple))),
      ),
    );
  }
}
