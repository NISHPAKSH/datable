// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const List<String> genderList = ["Not Set", "Male", "Female"];
const List<String> guardianTypeList = ["Mother", "Father", "Brother", "Sister"];
const List<String> yesNoArr = ["Yes", "No"];
const List<String> notificationTypes = [
  "None",
  "In App",
  "Email",
  "In App and Email"
];
const List<String> paymentTypes = ["Monthly", "Semi-Monthly"];
const List<String> absenceTypes = ["Absent", "Attending"];
const List<String> attendanceRoomTypes = ["Main", "Secondary", "All Rooms"];
const List<String> attendanceTypes = [
  "Full-Time",
  "Part-Time",
  "Drop-In (with availability)"
];
const List<String> attendanceScheduleTypes = [
  "Random Schedule",
  "Fixed Schedule"
];
const List<String> toiletType = ["Diaper", "Potty", "Other"];
const List<String> bowelMovementType = ["Dry", "Wet", "BowelMovement"];
const List<String> phoneNumbersType = ["Mobile", "Home", "Work"];
const List<String> shortOrderTypeList = [
  "First Name",
  "Last Name",
  "Total Hours"
];
const List<String> forUpdateTypes = [
  "Child",
  "Guardian",
  "Emergency Contact",
  "Authorized pickup"
];
const List<String> immunizationTypes = [
  "Fully vaccinated, up to date",
  "Vaccinated, slightly behind",
  "Not vaccinated yet, but will be",
  "Not vaccinated, no intention on doing so"
];
List<String> weekDays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday"
];

List<String> sortingList = [
  "First Name",
  "Last Name",
  "Total Hours",
  "Youngest to Oldest"
];

String getYesNoByBoolValue(bool value) {
  if (value) {
    return "Yes";
  } else {
    return "No";
  }
}

bool? getYesNoBoolValueFromString(String value) {
  if (value.toLowerCase().contains("yes")) {
    return true;
  } else {
    return false;
  }
}

String getFormattedTime(TimeOfDay value, {String? customFormat}) {
  var outputDate = "";
  final now = DateTime.now();
  var date = DateTime(now.year, now.month, now.day, value.hour, value.minute);
  if (customFormat == null) {
    var outputFormat = DateFormat('hh:mm a');
    outputDate = outputFormat.format(date);
  } else {
    var outputFormat = DateFormat(customFormat);
    outputDate = outputFormat.format(date);
  }
  return outputDate;
}

String getFormattedApiDateTime(DateTime value, {String? customFormat}) {
  var outputDate = "";
  if (customFormat == null) {
    var outputFormat = DateFormat('hh:mm a');
    outputDate = outputFormat.format(value);
  } else {
    var outputFormat = DateFormat(customFormat);
    outputDate = outputFormat.format(value);
  }
  return outputDate;
}

bool isStringNotEmptyOrNull(String? value) {
  return ((value == null) || value.isEmpty) ? false : true;
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

int hoursBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return to.difference(from).inHours;
}

int minutesBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return to.difference(from).inMinutes;
}

int secondsBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return to.difference(from).inSeconds;
}
