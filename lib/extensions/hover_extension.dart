import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:portfolio/extensions/hovering_widget.dart';

extension HoverExtensions on Widget {
  // Get a reference to the body of the view
  static final appContainer = html.window.document.getElementById('app-container');

  Widget get moveUpOnHover {
    return TranslateOnHover(
      child: this,
    );
  }
}
