import 'dart:collection';
import 'dart:developer';

import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../ui/utils/snackbar_util.dart';

class ReserveController extends GetxController {
  //TODO: Implement ReserveController
  final homeController = Get.find<HomeController>();
  //final provider = ReserveProvider();
  //var reserve = <Reserve>[].obs;
  //late final ValueNotifier<List<Event>> selectedEvents;

  CalendarFormat calendarFormat = CalendarFormat.month;
  //RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOff;

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  //DateTime? rangeStart;
  //DateTime? rangeEnd;

  /*Map<DateTime, List> eventsList = {};

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }*/

  @override
  Future<void> onInit() async {
    selectedDay = focusedDay;
    //selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
    //inspect(selectedEvents);

    //eventsList = {
    //DateTime.now().subtract(Duration(days: 2)): ['Event A1', 'Event B1'],
    //DateTime.now(): ['Event A2', 'Event B2', 'Event C1', 'Event D1'],
    /*DateTime.utc(kFirstDay.year, kFirstDay.month, 4): [
        'Presencial Hora: 10:00',
        'Virtual Hora: 11:00',
        'Virtual Hora: 11:30'
      ],*/
    /*DateTime.now().add(Duration(days: 1)): [
        'Event A3',
        'Event B3',
        'Event C2',
        'Event D2'
      ],*/
    /*DateTime.now().add(Duration(days: 3)):
          Set.from(['Event A4', 'Event A5', 'Event B4']).toList(),*/
    /*DateTime.now().add(Duration(days: 7)): [
        'Event A6',
        'Event B5',
        'Event C3'
      ],*/
    //};

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    //await getReserve();
    //print(DateTime.now());

    super.onReady();
  }

  @override
  void onClose() {
    //selectedEvents.dispose();
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

  /*List<Event> getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }*/

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

      //selectedEvents.value = getEventsForDay(s);
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

  /*Future<void> getReserve() async {
    late String title;
    late String message;

    try {
      List<Reserve> reserve = await provider.getReserve("N");
      changeRequest(reserve);
      inspect(reserve);
      //changeIsLoading(false);
    } catch (error) {
      title = "Error";
      message = error.toString();
      //changeIsLoading(false);
      SnackbarUtil().snackbarError(title, message);
    }
  }*/

  /*final events = LinkedHashMap<DateTime, List>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(eventsList);

  List getEventForDay(DateTime day) {
    return events[day] ?? [];
  }*/

  /*void changeRequest(List<Reserve> data) {
    reserve.clear();
    reserve(data);
  }*/

  /*void clearReserve() {
    reserve.clear();
  }*/

}
