import 'package:abas_flutter/models/sport.dart';
import 'package:abas_flutter/tabs/sport_tab.dart';
import 'package:flutter/material.dart';

class SportsPage extends StatelessWidget {
  final List<Sport> sports;
  const SportsPage({Key? key, required this.sports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      for (final sport in sports) SportTab(sport: sport),
    ]);
  }
}
