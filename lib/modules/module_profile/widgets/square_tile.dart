import 'dart:developer';

import 'package:flutter/material.dart';

class SquareTileWidget extends StatefulWidget {
  const SquareTileWidget({
    Key? key,
    this.selected = false,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final bool selected;
  final String text;
  final Widget icon;
  final Function(bool selected) onTap;

  @override
  State<SquareTileWidget> createState() => _SquareTileWidgetState();
}

class _SquareTileWidgetState extends State<SquareTileWidget> {
  late bool selected;

  @override
  void initState() {
    selected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selected = !selected;
        setState(() {});
        widget.onTap.call(selected);
        log('$selected', name: 'SquaredTile');
      },
      child: AnimatedContainer(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: widget.selected ? const Color(0xffE8DEF8) : const Color(0xffFEF7FF),
        ),
        duration: const Duration(milliseconds: 300),
        child: Column(
          children: [
            widget.icon,
            const Spacer(),
            Expanded(
              child: Text(
                widget.text,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
