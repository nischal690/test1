import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

bool returnnulllatlang(LatLng? currentlocation) {
  // checkout if current latlang is equal to LatLng(0.0, 0.0);
  if (currentlocation == null) {
    return true;
  }
  return currentlocation.latitude == 0.0 && currentlocation.longitude == 0.0;
}

double? fetchlatitute(LatLng currentlocation) {
  return currentlocation.latitude;
}

double fetchlongitude(LatLng currentlocation) {
  return currentlocation.longitude;
}
