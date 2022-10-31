// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// ignore: avoid_types_as_parameter_names
Future navigateTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));
