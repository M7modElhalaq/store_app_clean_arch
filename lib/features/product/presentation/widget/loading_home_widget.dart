import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingHomeWidget extends StatelessWidget {
  const LoadingHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 200.0,
        height: 100.0,
        child: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Text(
            'Shimmer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}