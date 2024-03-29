import 'package:flutter/material.dart';

class RowWithIcon extends StatelessWidget {

  final String imageLink;
  final String text;
  
  RowWithIcon({required this.imageLink, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
      child:  Row(
        children: [
          Image.asset(
            imageLink,
            width: 30,
            height: 30,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w300
            ),
          )
        ],
      )
    );
  }
}