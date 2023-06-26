// ignore: file_names
import 'package:flutter/material.dart';

import '../../Side/NightCanteen_sidefiles.dart';
import 'FastFood.dart';
import 'MainCourse.dart';

class NightCanteen extends StatefulWidget {
  const NightCanteen({super.key});

  @override
  State<NightCanteen> createState() => _NightCanteenState();
}

class _NightCanteenState extends State<NightCanteen> {
  final int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: CustomScrollView(
        slivers: [
          SliverAppbar(),
          const Main_Course(),
          const Fast_Food(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SliverAppBar SliverAppbar() {
    return const SliverAppBar(
      backgroundColor: Color.fromARGB(255, 239, 239, 239),
      foregroundColor: Color.fromARGB(255, 255, 255, 255),
      pinned: true,
      stretch: true,
      snap: true,
      floating: true,
      expandedHeight: 420,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        expandedTitleScale: 1.0,
        titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 5),
        title: Menu(),
        background: Padding(
          padding: EdgeInsets.fromLTRB(20, 80, 20, 0),
          child: Upper_Title(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
