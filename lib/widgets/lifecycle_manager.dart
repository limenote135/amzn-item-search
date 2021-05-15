import 'package:flutter/material.dart';

/// ライフサイクルコールバックインターフェース
mixin LifecycleCallback {
  void onResumed(BuildContext context) {}

  void onPaused(BuildContext context) {}

  void onInactive(BuildContext context) {}

  void onDetached(BuildContext context) {}
}

/// ライフサイクルを受け取れるStatefulWidget
class LifecycleManager extends StatefulWidget {
  const LifecycleManager({
    Key? key,
    required this.child,
    this.callback,
  }) : super(key: key);

  final Widget child;
  final LifecycleCallback? callback;

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.callback?.onResumed(context);
        break;
      case AppLifecycleState.inactive:
        widget.callback?.onInactive(context);
        break;
      case AppLifecycleState.paused:
        widget.callback?.onPaused(context);
        break;
      case AppLifecycleState.detached:
        widget.callback?.onDetached(context);
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
