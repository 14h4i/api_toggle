library api_toggle;

import 'dart:async';

import 'package:flutter/material.dart';

class ApiToggle extends StatefulWidget {
  const ApiToggle({
    super.key,
    required this.disabledChild,
    required this.enabledChild,
    this.delay = 300,
    this.activated = false,
    required this.onTrigger,
    required this.onTap,
  });

  final bool activated;
  final Widget disabledChild;
  final Widget enabledChild;
  final int delay;
  final void Function(bool activated) onTrigger;
  final void Function(bool activated) onTap;

  @override
  State<ApiToggle> createState() => _ApiToggleState();
}

class _ApiToggleState extends State<ApiToggle> {
  late bool _activated;
  int _count = 0;
  Timer? _debounce;

  @override
  void initState() {
    _activated = widget.activated;
    super.initState();
  }

  @override
  void didUpdateWidget(ApiToggle oldWidget) {
    if (oldWidget.activated != widget.activated) {
      _activated = widget.activated;
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _activated = !_activated;
          _count++;
        });

        widget.onTap(_activated);

        if (_debounce?.isActive ?? false) {
          _debounce!.cancel();
        }

        _debounce = Timer(Duration(milliseconds: widget.delay), () {
          if (_count % 2 == 1) {
            _count = 0;
            widget.onTrigger(_activated);
          }
        });
      },
      child: _activated ? widget.enabledChild : widget.disabledChild,
    );
  }
}
