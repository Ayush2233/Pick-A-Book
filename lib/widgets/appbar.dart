import 'package:flutter/material.dart';

PreferredSizeWidget Applibar()
{
  return AppBar
    (
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions:
    [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: 40,
          decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.black),

        ),
      )
    ],

  );
}