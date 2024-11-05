/*
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yapay_zeka_final/main.dart';

class FiyatWidget extends ConsumerWidget {
  const FiyatWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ref.watch(fiyatProvider).length(),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(ref.watch(fiyatProvider)[index]["fiyat"]),
            ),
          );
        },
      ),
    );
  }
}
*/