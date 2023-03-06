import 'dart:collection';

import 'package:conexion/app/modules/home/controllers/home_controller.dart';
import 'package:conexion/app/routes/app_pages.dart';
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
                title: const Text('Reservar cita',
                    style: TextStyle(color: Colors.black)),
                backgroundColor: HelperTheme.primary,
              ),
              body: Column(
                children: [
                  TableCalendar(
                    locale: 'es_PE',
                    weekendDays: const [DateTime.saturday, DateTime.sunday],
                    firstDay: kFirstDay,
                    lastDay: kLastDay,
                    focusedDay: controller.focusedDay,
                    calendarFormat: controller.calendarFormat,
                    eventLoader: getEventForDay,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDay, day);
                    },
                    onDaySelected: controller.onDaySelected,
                    onFormatChanged: (format) {
                      if (controller.calendarFormat != format) {
                        controller.changeCalendarFormat(format);
                      }
                    },
                    onPageChanged: (focusedDay) {
                      controller.focusedDay = focusedDay;
                    },
                    calendarStyle: const CalendarStyle(
                      markersAlignment: Alignment.bottomRight,
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
                      selectedBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: HelperTheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: HelperTheme.black),
                          )),
                      todayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: HelperTheme.warning,
                              shape: BoxShape.circle),
                          child: Text(
                            date.day.toString(),
                            style: const TextStyle(color: HelperTheme.black),
                          )),
                      markerBuilder: (context, day, events) => events.isNotEmpty
                          ? Container(
                              width: 17.0,
                              height: 17.0,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: HelperTheme.success,
                              ),
                              child: Text(
                                '${events.length}',
                                style:
                                    const TextStyle(color: HelperTheme.black),
                              ),
                            )
                          : null,
                      dowBuilder: (context, day) {
                        if (day.weekday == DateTime.sunday ||
                            day.weekday == DateTime.saturday) {
                          final text = DateFormat.E('es').format(day);
                          return Center(
                            child: Text(
                              text,
                              style: const TextStyle(color: Colors.red),
                            ),
                          );
                        }
                        return null;
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
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Image.asset(
                                            'assets/images/logo_texto.png',
                                            width: 100.0,
                                            height: 50.0,
                                            scale: 1.0,
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Container(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5,
                                                        vertical: 5),
                                                    child: Text(
                                                      'Esta seguro que desea reserva una cita?'
                                                          .tr,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: HelperTheme
                                                          .labelBackMd,
                                                      maxLines: 3,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.green),
                                              child: const Text('Si',
                                                  style: TextStyle(
                                                      color: Colors.white)),
                                              onPressed: () async {
                                                await controller.dialogClose();
                                                await controller.homeController
                                                    .registrerReserve(
                                                        controller.selectedDay,
                                                        event.toString());
                                              },
                                            ),
                                          ],
                                        );
                                      }).then((value) {
                                    controller.dialogClose();
                                  });
                                },
                                title: Text(event.toString()),
                              ),
                            ))
                        .toList(),
                  )),
                ],
              ));
        });
  }
}
