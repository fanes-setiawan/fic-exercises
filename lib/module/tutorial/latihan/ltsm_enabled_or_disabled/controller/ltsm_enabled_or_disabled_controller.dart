import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/ltsm_enabled_or_disabled_view.dart';

class LtsmEnabledOrDisabledController extends State<LtsmEnabledOrDisabledView> implements MvcController {
  static late LtsmEnabledOrDisabledController instance;
  late LtsmEnabledOrDisabledView view;
  bool enabled = false;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
