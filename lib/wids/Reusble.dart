import 'package:flutter/material.dart';

class Rrow extends StatelessWidget {
  String Title, Value;
  Rrow({super.key, required this.Title, required this.Value});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Title),
                  Text(Value),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider()
            ],
          )),
    );
  }
}
