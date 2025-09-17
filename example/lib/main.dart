import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('in', 'ID'),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('in', 'ID'),
        Locale('id'),
      ],
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: 400,
                      child: DatePickerQib(
                        maxDate: DateTime.now(),
                        minDate:
                            DateTime.now().subtract(const Duration(days: 365)),
                        onDateSelected: (date) {
                          // Your logic here
                        },
                        initialDate: DateTime.now(),
                        selectedDate: DateTime.now(),
                        currentDate: DateTime.now(),
                        padding: const EdgeInsets.all(8.0),
                        initialPickerType: PickerType.days,
                        daysOfTheWeekTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        enabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsDecoration: const BoxDecoration(),
                        currentDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        currentDateDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),

                        selectedCellTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        selectedCellDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        leadingDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        // slidersColor: ColorsApp.brown50,
                        // slidersSize: 20,
                        // highlightColor:
                        //     ColorsApp.yellow90,
                        // splashColor:
                        //      ColorsApp.brown10,
                        // splashRadius: 24,
                        // centerLeadingDate: false,
                        weekendTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      )),
                  SizedBox(
                      height: 400,
                      child: RangeDatePickerQib(
                        maxDate: DateTime.now(),
                        minDate:
                            DateTime.now().subtract(const Duration(days: 365)),
                        padding: const EdgeInsets.all(8.0),
                        daysOfTheWeekTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        enabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsDecoration: const BoxDecoration(),
                        currentDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        currentDateDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        selectedCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        singleSelectedCellDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        singleSelectedCellTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        selectedCellsDecoration: const BoxDecoration(),
                        leadingDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        // slidersColor: ColorsApp.brown50,
                        // slidersSize: 20,
                        // highlightColor:
                        //     ColorsApp.yellow90,
                        // splashColor:
                        //      ColorsApp.brown10,
                        // splashRadius: 24,
                        // centerLeadingDate: false,
                        weekendTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      )),
                  SizedBox(
                      height: 400,
                      child: DatePickerQtoken(
                        maxDate: DateTime.now(),
                        minDate:
                            DateTime.now().subtract(const Duration(days: 365)),
                        onDateSelected: (date) {
                          // Your logic here
                        },
                        initialDate: DateTime.now(),
                        selectedDate: DateTime.now(),
                        currentDate: DateTime.now(),
                        padding: const EdgeInsets.all(8.0),
                        initialPickerType: PickerType.days,
                        daysOfTheWeekTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        enabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsDecoration: const BoxDecoration(),
                        currentDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        currentDateDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),

                        selectedCellTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        selectedCellDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        leadingDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        // slidersColor: ColorsApp.brown50,
                        // slidersSize: 20,
                        // highlightColor:
                        //     ColorsApp.yellow90,
                        // splashColor:
                        //      ColorsApp.brown10,
                        // splashRadius: 24,
                        // centerLeadingDate: false,
                        weekendTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      )),
                  SizedBox(
                      height: 400,
                      child: RangeDatePickerQtoken(
                        maxDate: DateTime.now(),
                        minDate:
                            DateTime.now().subtract(const Duration(days: 365)),
                        padding: const EdgeInsets.all(8.0),
                        daysOfTheWeekTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        enabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        disabledCellsDecoration: const BoxDecoration(),
                        currentDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        currentDateDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        selectedCellsTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        singleSelectedCellDecoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        singleSelectedCellTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        selectedCellsDecoration: const BoxDecoration(),
                        leadingDateTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                        // slidersColor: ColorsApp.brown50,
                        // slidersSize: 20,
                        // highlightColor:
                        //     ColorsApp.yellow90,
                        // splashColor:
                        //      ColorsApp.brown10,
                        // splashRadius: 24,
                        // centerLeadingDate: false,
                        weekendTextStyle: const TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
