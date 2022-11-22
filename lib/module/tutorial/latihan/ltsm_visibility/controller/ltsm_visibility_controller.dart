import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/ltsm_visibility_view.dart';

class LtsmVisibilityController extends State<LtsmVisibilityView> implements MvcController {
  static late LtsmVisibilityController instance;
  late LtsmVisibilityView view;
  bool visible = false;

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
