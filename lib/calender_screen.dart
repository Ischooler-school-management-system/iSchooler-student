import 'package:flutter/material.dart';

import 'common/common_features/widgets/educonnect_screen.dart';
import 'common/style/educonnect_colors.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IschoolerScreen(
      appBar: AppBar(
        backgroundColor: IschoolerColors.blue,
        foregroundColor: IschoolerColors.white,
        title: const Text('ISCHOOLER'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('CalenderScreen'),
      ),
    );
  }
}
