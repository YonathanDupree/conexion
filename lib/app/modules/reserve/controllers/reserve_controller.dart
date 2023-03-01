import 'dart:developer';

import 'package:conexion/app/ui/utils/event_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ReserveController extends GetxController {
  //TODO: Implement ReserveController
  late final ValueNotifier<List<Event>> selectedEvents;

  CalendarFormat calendarFormat = CalendarFormat.month;
  //RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  //DateTime? rangeStart;
  //DateTime? rangeEnd;

  Map<DateTime, List> eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }

  @override
  void onInit() {
    selectedDay = focusedDay;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
    inspect(selectedEvents);

    eventsList = {
      DateTime.now().subtract(Duration(days: 2)): ['Event A1', 'Event B1'],
      DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
      DateTime.now().add(Duration(days: 1)): [
        'Event A3',
        'Event B3',
        'Event C2',
        'Event D2'
      ],
      DateTime.now().add(Duration(days: 3)):
          Set.from(['Event A4', 'Event A5', 'Event B4']).toList(),
      DateTime.now().add(Duration(days: 7)): [
        'Event A6',
        'Event B5',
        'Event C3'
      ],
    };

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    selectedEvents.dispose();
    super.onClose();
  }

  void changeSelectDay(DateTime s, DateTime f) {
    selectedDay = s;
    focusedDay = f;
    update();
  }

  void changeCalendarFormat(CalendarFormat c) {
    calendarFormat = c;
    update();
  }

  List<Event> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  /*List<Event> getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ...getEventsForDay(d),
    ];
  }*/

  void onDaySelected(DateTime s, DateTime f) {
    if (!isSameDay(selectedDay, s)) {
      selectedDay = s;
      focusedDay = f;
      //rangeStart = null; // Important to clean those
      //rangeEnd = null;
      //rangeSelectionMode = RangeSelectionMode.toggledOff;

      update();

      selectedEvents.value = getEventsForDay(s);
    }
  }

  /*void onRangeSelected(DateTime? start, DateTime? end, DateTime f) {
    selectedDay = null;
    focusedDay = f;
    rangeStart = start;
    rangeEnd = end;
    rangeSelectionMode = RangeSelectionMode.toggledOn;
    update();

    // `start` or `end` could be null
    /*if (start != null && end != null) {
      selectedEvents.value = getEventsForRange(start, end);
    } else */
    if (start != null) {
      selectedEvents.value = getEventsForDay(start);
    } else if (end != null) {
      selectedEvents.value = getEventsForDay(end);
    }
  }*/

}
