import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenSearchBar extends ConsumerStatefulWidget {
  final void Function(String searchQuery) onChanged;

  const TokenSearchBar({super.key, required this.onChanged});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TokenSearchBarState();
}

class _TokenSearchBarState extends ConsumerState<TokenSearchBar> {
  TextEditingController searchCtrl = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      child: TextField(
        style: GoogleFonts.poppins(
            fontSize: 12, color: Theme.of(context).primaryColor.withAlpha(150)),
        onChanged: (value) {
          widget.onChanged(value);
        },
        controller: searchCtrl,
        decoration: InputDecoration(
          hintText: "What are you looking for?",
          filled: true,
          hoverColor: Theme.of(context).primaryColor,
          hintStyle: GoogleFonts.poppins(
              fontSize: 12,
              color: Theme.of(context).primaryColor.withAlpha(150)),
          prefixIcon: Icon(Icons.search),
          prefixIconColor: Theme.of(context).primaryColor.withAlpha(150),
           border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100), // กำหนดความโค้ง
            borderSide: BorderSide.none, // ไม่มีเส้นขอบ
          ),
        ),
      ),
    );
  }
}
