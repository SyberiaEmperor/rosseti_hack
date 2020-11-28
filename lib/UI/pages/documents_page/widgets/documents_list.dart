import 'package:flutter/material.dart';
import 'package:rosseti/UI/pages/documents_page/widgets/document_item.dart';

class DocumentsList extends StatelessWidget {
  final List<String> list = [
    "Документ 1",
    "Это название документа",
    "Это тоже название документа",
    "Документ 4",
    "Документик",
  ];//TODO исправить
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) => DocumentItem(list[index]),
    );
  }
}
