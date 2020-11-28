import 'package:flutter/material.dart';
import 'package:rosseti/UI/classes/responsive_size.dart';
import 'package:rosseti/UI/pages/documents_page/widgets/documents_list.dart';

class DocumentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Документация",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 24.height,
            ),
          ),
          Expanded(
            child: DocumentsList(),
          )
        ],
      ),
    );
  }
}