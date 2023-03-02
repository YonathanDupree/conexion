import 'dart:collection';

import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/modules/nutritionist/controllers/nutritionist_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../ui/themes/helper_theme.dart';
import '../../../ui/utils/event_util.dart';
import '../controllers/reserve_controller.dart';

class ReserveView extends GetView<HomeController> {
  const ReserveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: controller.getHashCode,
    )..addAll(controller.eventsList);

    List getEventForDay(DateTime day) {
      return events[day] ?? [];
    }

    return GetBuilder<ReserveController>(
        init: ReserveController(),
        initState: (controller) {},
        builder: (controller) {
          return Scaffold(
              backgroundColor: HelperTheme.white,
              appBar: AppBar(
                title: const Text('Reservar cita'),
                centerTitle: true,
                backgroundColor: HelperTheme.primary,
              ),
              body: Column(
                children: [
                  TableCalendar(
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: controller.focusedDay,
                    //rangeStartDay: controller.rangeStart,
                    //rangeEndDay: controller.rangeEnd,
                    calendarFormat: controller.calendarFormat,
                    //rangeSelectionMode: controller.rangeSelectionMode,
                    eventLoader: getEventForDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDay, day);
                    },
                    /*onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(controller.selectedDay, selectedDay)) {
                      controller.changeSelectDay(selectedDay, focusedDay);
                    }
                  },*/
                    onDaySelected: controller.onDaySelected,
                    //onRangeSelected: controller.onRangeSelected,
                    onFormatChanged: (format) {
                      if (controller.calendarFormat != format) {
                        controller.changeCalendarFormat(format);
                      }
                    },
                    onPageChanged: (focusedDay) {
                      controller.focusedDay = focusedDay;
                    },
                    calendarStyle: const CalendarStyle(
                      outsideDaysVisible: false,
                      canMarkersOverflow: true,
                      todayTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: HelperTheme.primary),
                      selectedTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: HelperTheme.white),
                    ),
                    headerStyle: const HeaderStyle(
                        titleCentered: true,
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: HelperTheme.black)),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        if (day.weekday == DateTime.sunday ||
                            day.weekday == DateTime.saturday) {
                          final text = DateFormat.E().format(day);

                          return Center(
                            child: Text(
                              text,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Expanded(
                      child: ListView(
                    shrinkWrap: true,
                    children: getEventForDay(controller.selectedDay!)
                        .map((event) => Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                onTap: () {
                                  controller.homeController.registrerReserve(
                                      controller.selectedDay, event.toString());
                                  /*print("Entro");
                                  print(controller.selectedDay.toString());
                                  print("aaaa");
                                  print(controller.selectedDay.runtimeType);
                                  print("bbbb");
                                  print(event.toString());*/
                                },
                                title: Text(event.toString()),
                              ),
                            ))
                        .toList(),
                  )

                      /*child: ValueListenableBuilder<List<Event>>(
                      valueListenable: controller.selectedEvents,
                      builder: (context, value, _) {
                        return ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 4.0,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ListTile(
                                onTap: () => print('${value[index]}'),
                                title: Text('${value[index]}'),
                              ),
                            );
                          },
                        );
                      },
                    ),*/
                      ),
                ],
              ));
        });
  }
}
