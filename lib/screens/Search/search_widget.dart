import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Container(
        height: 60,
        width: double.maxFinite,
        child: Text(style, context),
      ),
    );
  }

  TextField Text(TextStyle style, BuildContext context) {
    return TextField(
      enabled: true,
      controller: controller,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: const Color.fromRGBO(255, 243, 240, 1),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.lato(
            fontSize: 18, color: const Color.fromRGBO(164, 73, 21, 1)),
        suffixIcon: widget.text.isNotEmpty
            ? GestureDetector(
                child: Icon(Icons.close, color: style.color),
                onTap: () {
                  controller.clear();
                  widget.onChanged('');
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              )
            : null,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, bottom: 10),
          child: Image.asset(
            'assets/buttons/Search_1.png',
            height: 25,
            width: 25,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromRGBO(164, 73, 21, 1)),
        ),
      ),
      style: style,
      onChanged: widget.onChanged,
    );
  }
}
