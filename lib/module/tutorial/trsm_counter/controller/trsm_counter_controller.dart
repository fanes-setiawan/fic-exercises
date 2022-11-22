import 'package:flutter/material.dart';
import 'package:example/state_util.dart';
import '../view/trsm_counter_view.dart';

class TrsmCounterController extends State<TrsmCounterView>
    implements MvcController {
  static late TrsmCounterController instance;
  late TrsmCounterView view;
  int counter = 0;

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
