import 'package:flutter/material.dart';

class TopAlignedCheckboxTile extends StatefulWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final Widget title;

  const TopAlignedCheckboxTile({
    super.key,
    required this.value,
    required this.onChanged,
    required this.title,
  });

  @override
  State<TopAlignedCheckboxTile> createState() => _TopAlignedCheckboxTileState();
}

class _TopAlignedCheckboxTileState extends State<TopAlignedCheckboxTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: widget.value,
          onChanged: widget.onChanged,
        ),
        Expanded(child: widget.title),
      ],
    );
  }
}
