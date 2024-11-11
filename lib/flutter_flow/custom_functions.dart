import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String scoreInference(String? score) {
  if (score == null) {
    score = "";
  }

  int newscore;

  try {
    newscore = int.parse(score);
  } catch (e) {
    newscore = -1;
  }

  if (newscore == -1) {
    return "";
  }

  if (newscore >= 80) {
    return " - Very low environmental impact";
  } else if (newscore >= 70) {
    return " - Low environmental impact";
  } else if (newscore >= 50) {
    return " - Moderate environmental impact";
  } else if (newscore >= 40) {
    return " - High environmental impact";
  } else {
    return " - Very high environmental impact";
  }
}

String captalize(String? letter) {
  if (letter == null || letter == "") {
    return "Sorry, unable to find nutrition score.";
  } else {
    return letter.toUpperCase();
  }
}
