import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerView extends StatefulWidget {
  const ShimmerView({super.key});

  @override
  State<ShimmerView> createState() => _ShimmerViewState();
}

class _ShimmerViewState extends State<ShimmerView> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shimmer'),
      ),
      body: isLoading
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  period: const Duration(seconds: 1),
                  loop: 200,
                  enabled: true,
                  baseColor: Colors.grey[500]!,
                  highlightColor: Colors.grey[200]!,
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                    title: Container(
                      height: 14,
                      color: Colors.white,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14,
                          width: 150,
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 5),
                        ),
                        Container(
                          height: 14,
                          width: 150,
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 5),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ListTile(
                  leading: Icon(
                    Icons.shopping_bag,
                    size: 50,
                  ),
                  title: Text('The title'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('The description'),
                      Text('The description'),
                    ],
                  ),
                );
              }),
    );
  }
}
