import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// ライフサイクルコールバックインターフェース
mixin LifecycleCallback {
  void onResumed(BuildContext context, WidgetRef ref) {}

  void onPaused(BuildContext context, WidgetRef ref) {}

  void onInactive(BuildContext context, WidgetRef ref) {}

  void onDetached(BuildContext context, WidgetRef ref) {}
}

/// ライフサイクルを受け取れるStatefulWidget
class LifecycleManager extends ConsumerStatefulWidget {
  const LifecycleManager({
    Key? key,
    required this.child,
    this.callback,
  }) : super(key: key);

  final Widget child;
  final LifecycleCallback? callback;

  @override
  ConsumerState<LifecycleManager> createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends ConsumerState<LifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.callback?.onResumed(context, ref);
        break;
      case AppLifecycleState.inactive:
        widget.callback?.onInactive(context, ref);
        break;
      case AppLifecycleState.paused:
        widget.callback?.onPaused(context, ref);
        break;
      case AppLifecycleState.detached:
        widget.callback?.onDetached(context, ref);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
