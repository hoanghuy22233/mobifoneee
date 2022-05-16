// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobifone/src/src_index.dart';
import 'package:mobifone/widgets/widgets.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController inputController;
  const SearchWidget({Key? key, required this.inputController}) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return WidgetInput(
      hint: MESSAGES.SEARCH_POST,
      boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: COLORS.WHITE
      ),
      height: 45,
      inputController: widget.inputController,
      onChanged: (v){

      },
    );
  }
}
