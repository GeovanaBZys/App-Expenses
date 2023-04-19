import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Color.fromARGB(244, 238, 245, 140),
    Color.fromARGB(255, 234, 182, 241),
    Color.fromARGB(255, 156, 206, 247),
    Color.fromARGB(255, 197, 238, 186)
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(4);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          foregroundColor: Theme.of(context).colorScheme.secondary,
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('R\$${widget.tr.value}'),
            ),
          ),
        ),
        title: Text(
          widget.tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 380
            ? TextButton.icon(
                onPressed: (() => widget.onRemove(widget.tr.id)),
                icon: const Icon(Icons.delete),
                label: Text('Excluir'),
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(244, 244, 185, 136),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: const Color.fromARGB(244, 244, 185, 136),
                onPressed: (() => widget.onRemove(widget.tr.id)),
              ),
      ),
    );
  }
}
