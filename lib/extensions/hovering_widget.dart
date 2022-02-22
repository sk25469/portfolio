import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TranslateOnHover extends HookWidget {
  final Widget child;
  const TranslateOnHover({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
    final hoverTransform = Matrix4.identity()..translate(0, -10, 0);

    final isHovering = useState(false);

    final _mouseEnter = useCallback((bool hover) {
      isHovering.value = hover;
    }, [isHovering]);

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        child: child,
        transform: isHovering.value ? hoverTransform : nonHoverTransform,
      ),
    );
  }
}
