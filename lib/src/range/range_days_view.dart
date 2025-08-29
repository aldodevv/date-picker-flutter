// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:date_picker_plus/src/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart' show DateFormat;

import '../shared/picker_grid_delegate.dart';

/// Displays the days of a given month and allows choosing days range.
///
/// The days are arranged in a rectangular grid with one column for each day of
/// the week.
class RangeDaysView extends StatelessWidget {
  /// Displays the days of a given month and allows choosing  days range.
  ///
  /// The days are arranged in a rectangular grid with one column for each day of
  /// the week.
  RangeDaysView(
      {super.key,
      required this.currentDate,
      required this.minDate,
      required this.maxDate,
      required this.selectedStartDate,
      required this.selectedEndDate,
      required this.onStartDateChanged,
      required this.onEndDateChanged,
      required this.displayedMonth,
      required this.daysOfTheWeekTextStyle,
      required this.enabledCellsTextStyle,
      required this.enabledCellsDecoration,
      required this.disabledCellsTextStyle,
      required this.disabledCellsDecoration,
      required this.currentDateTextStyle,
      required this.currentDateDecoration,
      required this.selectedCellsTextStyle,
      required this.selectedCellsDecoration,
      required this.singleSelectedCellTextStyle,
      required this.singleSelectedCellDecoration,
      required this.highlightColor,
      required this.splashColor,
      required this.splashRadius,
      this.weekendTextStyle}) {
    assert(!minDate.isAfter(maxDate), "minDate can't be after maxDate");

    assert(() {
      if (selectedStartDate == null) return true;
      final min = DateTime(minDate.year, minDate.month, minDate.day);
      final max = DateTime(maxDate.year, maxDate.month, maxDate.day);
      final selected = DateTime(
        selectedStartDate!.year,
        selectedStartDate!.month,
        selectedStartDate!.day,
      );

      return (selected.isAfter(min) || selected.isAtSameMomentAs(min)) &&
          (selected.isBefore(max) || selected.isAtSameMomentAs(max));
    }(), "selected start date should be in the range of min date & max date");
    assert(() {
      if (selectedEndDate == null) return true;
      final min = DateTime(minDate.year, minDate.month, minDate.day);
      final max = DateTime(maxDate.year, maxDate.month, maxDate.day);
      final selected = DateTime(
        selectedEndDate!.year,
        selectedEndDate!.month,
        selectedEndDate!.day,
      );
      return (selected.isAfter(min) || selected.isAtSameMomentAs(min)) &&
          (selected.isBefore(max) || selected.isAtSameMomentAs(max));
    }(), "selected end date should be in the range of min date & max date");
  }

  /// The currently selected start date.
  ///
  /// This date is highlighted in the picker.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? selectedStartDate;

  /// The currently selected end date.
  ///
  /// This date is highlighted in the picker.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime? selectedEndDate;

  /// The current date. e.g (today).
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime currentDate;

  /// Called when the user picks a start date.
  final ValueChanged<DateTime> onStartDateChanged;

  /// Called when the user picks an end date.
  final ValueChanged<DateTime> onEndDateChanged;

  /// The earliest date the user is permitted to pick.
  ///
  /// This date must be on or before the [maxDate].
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime minDate;

  /// The latest date the user is permitted to pick.
  ///
  /// This date must be on or after the [minDate].
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime maxDate;

  /// The month whose days are displayed by this picker.
  ///
  /// Note that only dates are considered. time fields are ignored.
  final DateTime displayedMonth;

  /// The text style of the week days name.
  final TextStyle daysOfTheWeekTextStyle;

  /// The text style of cells which are selectable.
  final TextStyle enabledCellsTextStyle;

  /// The cell decoration of cells which are selectable.
  final BoxDecoration enabledCellsDecoration;

  /// The text style of cells which are not selectable.
  final TextStyle disabledCellsTextStyle;

  /// The cell decoration of cells which are not selectable.
  final BoxDecoration disabledCellsDecoration;

  /// The text style of a single selected cell and the
  /// leading/trailing cell of a selected range.
  final TextStyle singleSelectedCellTextStyle;

  /// The cell decoration of a single selected cell and the
  /// leading/trailing cell of a selected range.
  final BoxDecoration singleSelectedCellDecoration;

  /// The text style of the current date.
  final TextStyle currentDateTextStyle;

  /// The cell decoration of the current date.
  final BoxDecoration currentDateDecoration;

  /// The text style of selected cells in a range.
  final TextStyle selectedCellsTextStyle;

  /// The cell decoration of selected cells in a range.
  final BoxDecoration selectedCellsDecoration;

  /// The splash color of the ink response.
  final Color splashColor;

  /// The highlight color of the ink response when pressed.
  final Color highlightColor;

  /// The radius of the ink splash.
  final double? splashRadius;

  /// The text style of the weekend days.
  final TextStyle? weekendTextStyle;

  /// Builds widgets showing abbreviated days of week. The first widget in the
  /// returned list corresponds to the first day of week for the current locale.
  ///
  /// Examples:
  ///
  ///     ┌ Sunday is the first day of week in the US (en_US)
  ///     |
  ///     S M T W T F S  ← the returned list contains these widgets
  ///     _ _ _ _ _ 1 2
  ///     3 4 5 6 7 8 9
  ///
  ///     ┌ But it's Monday in the UK (en_GB)
  ///     |
  ///     M T W T F S S  ← the returned list contains these widgets
  ///     _ _ _ _ 1 2 3
  ///     4 5 6 7 8 9 10
  ///
  List<Widget> _dayHeaders(
    TextStyle headerStyle,
    Locale locale,
    MaterialLocalizations localizations,
  ) {
    final List<Widget> result = <Widget>[];
    final weekdayNames =
        DateFormat('', locale.toString()).dateSymbols.SHORTWEEKDAYS;

    const int firstDayOfWeekIndex = 1; // Monday

    for (int i = 0; i < 7; i++) {
      final int dayIndex = (firstDayOfWeekIndex + i) % 7;
      final bool isWeekend = dayIndex == 0 || dayIndex == 6;
      // to save space in arabic as arabic don't has short week days.
      final String weekday = weekdayNames[dayIndex].replaceFirst('ال', '');
      result.add(
        ExcludeSemantics(
          child: Center(
            child: Text(
              weekday.toUpperCase(),
              style: isWeekend && weekendTextStyle != null
                  ? weekendTextStyle!
                  : daysOfTheWeekTextStyle,
            ),
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final MaterialLocalizations localizations =
        MaterialLocalizations.of(context);
    //
    //
    //
    final int year = displayedMonth.year;
    final int month = displayedMonth.month;
    final int daysInMonth =
        DateUtils.getDaysInMonth(displayedMonth.year, displayedMonth.month);
    final int dayOffset;
    {
      const int firstDayOfWeekIndex = 1; // Monday
      final int weekdayFromSunday = DateTime(year, month).weekday % 7;
      dayOffset = (weekdayFromSunday - firstDayOfWeekIndex + 7) % 7;
    }
    DateTime? selectedEndDateOnly =
        selectedEndDate != null ? DateUtils.dateOnly(selectedEndDate!) : null;

    DateTime? selectedStartDateOnly = selectedStartDate != null
        ? DateUtils.dateOnly(selectedStartDate!)
        : null;

    final _maxDate = DateUtils.dateOnly(maxDate);
    final _minDate = DateUtils.dateOnly(minDate);

    final List<Widget> dayItems = _dayHeaders(
      daysOfTheWeekTextStyle,
      Localizations.localeOf(context),
      MaterialLocalizations.of(context),
    );

    int day = -dayOffset;
    while (day < daysInMonth) {
      day++;
      if (day < 1) {
        dayItems.add(const SizedBox.shrink());
      } else {
        final DateTime dayToBuild = DateTime(year, month, day);
        final bool isDisabled =
            dayToBuild.isAfter(_maxDate) || dayToBuild.isBefore(_minDate);

        final isRangeSelected =
            selectedStartDateOnly != null && selectedEndDateOnly != null;

        final isStartSelectedOnly = selectedStartDateOnly != null &&
            dayToBuild == selectedStartDateOnly &&
            selectedEndDateOnly == null;

        final isEndSelectedOnly = selectedStartDateOnly == null &&
            selectedEndDateOnly != null &&
            dayToBuild == selectedEndDateOnly;

        final isRangeOnlyOneDate =
            selectedStartDateOnly == selectedEndDateOnly &&
                dayToBuild == selectedStartDateOnly;

        final isSingleCellSelected =
            isStartSelectedOnly || isEndSelectedOnly || isRangeOnlyOneDate;

        final bool isWithinRange = isRangeSelected &&
            dayToBuild.isAfter(selectedStartDateOnly) &&
            dayToBuild.isBefore(selectedEndDateOnly) &&
            !isRangeOnlyOneDate;

        final isStartDate =
            DateUtils.isSameDay(selectedStartDateOnly, dayToBuild);

        final isEndDate = DateUtils.isSameDay(selectedEndDateOnly, dayToBuild);

        final bool isCurrent = DateUtils.isSameDay(currentDate, dayToBuild);
        final bool isWeekend = dayToBuild.weekday == DateTime.saturday ||
            dayToBuild.weekday == DateTime.sunday;

        BoxDecoration decoration = enabledCellsDecoration;
        TextStyle style = enabledCellsTextStyle;

        if (isWeekend && weekendTextStyle != null) {
          style = weekendTextStyle!;
        }

        if (isCurrent) {
          style = currentDateTextStyle;
          decoration = currentDateDecoration;
        }

        if (isSingleCellSelected || isStartDate || isEndDate) {
          style = singleSelectedCellTextStyle;
          decoration = singleSelectedCellDecoration;
        }

        if (isWithinRange) {
          style = selectedCellsTextStyle;
          decoration = selectedCellsDecoration;
        }

        if (isDisabled) {
          style = disabledCellsTextStyle;
          decoration = disabledCellsDecoration;
        }

        if (!isWeekend && isCurrent && isDisabled) {
          style = disabledCellsTextStyle;
          decoration = currentDateDecoration;
        }

        Widget dayWidget = Container(
          width: 32.0,
          height: 32.0,
          decoration: BoxDecoration(
            color: isStartDate || isEndDate
                ? ColorsApp.brown50
                : isCurrent
                    ? ColorsApp.brown10
                    : null,
            border: isStartDate || isEndDate
                ? Border.all(color: ColorsApp.brown50, width: 1)
                : null,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Center(
            child: Text(localizations.formatDecimal(day), style: style),
          ),
        );

        dayWidget = Container(
          height: 32.0,
          width: 32.0,
          clipBehavior: Clip.hardEdge,
          decoration: decoration,
          child: dayWidget,
        );

        // Add padding for selected cells like in daysPicker
        EdgeInsets getDayPadding() {
          if (isSingleCellSelected || isCurrent) {
            return const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0);
          } else if (isStartDate) {
            return const EdgeInsets.fromLTRB(6.0, 2.0, 0.0, 2.0);
          } else if (isEndDate) {
            return const EdgeInsets.fromLTRB(0.0, 2.0, 6.0, 2.0);
          }
          return const EdgeInsets.symmetric(vertical: 2.0);
        }

        if (isSingleCellSelected ||
            isStartDate ||
            isEndDate ||
            isCurrent ||
            isRangeSelected) {
          dayWidget = Padding(
            padding: getDayPadding(),
            child: dayWidget,
          );
        }

        //! disable for background color range picker
        // if ((isStartDate || isEndDate) && isRangeSelected) {
        //   dayWidget = CustomPaint(
        //     painter: _DecorationPainter(
        //       textDirection: Directionality.of(context),
        //       color: selectedCellsDecoration.color,
        //       start: isStartDate,
        //     ),
        //     child: dayWidget,
        //   );
        // }

        if (isDisabled) {
          dayWidget = ExcludeSemantics(
            child: dayWidget,
          );
        } else {
          dayWidget = InkResponse(
            onTap: () {
              final isStart =
                  (selectedEndDate == null && selectedStartDate == null) ||
                      (selectedEndDate != null && selectedStartDate != null);

              if (isStart) {
                onStartDateChanged(dayToBuild);
                return;
              }

              if (dayToBuild.isBefore(selectedStartDate!)) {
                onStartDateChanged(dayToBuild);
                onEndDateChanged(selectedStartDate!);
                return;
              }

              onEndDateChanged(dayToBuild);
            },
            radius: splashRadius,
            splashColor: splashColor,
            highlightColor: highlightColor,
            child: dayWidget,
          );
        }

        dayItems.add(dayWidget);
      }
    }

    return GridView.custom(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const PickerGridDelegate(columnCount: 7, rowCount: 7),
      childrenDelegate: SliverChildListDelegate(
        dayItems,
        addRepaintBoundaries: false,
      ),
    );
  }
}

/// A custom painter class for decorating a widget with a colored rectangle.
///
/// The [_DecorationPainter] class extends [CustomPainter] and is responsible
/// for painting a colored rectangle on a canvas based on specified parameters.
/// This class is typically used as the painter for a [CustomPaint] widget to
/// achieve a customized visual effect.
///
/// ### Example:
///
/// ```dart
/// CustomPaint(
///   painter: _DecorationPainter(
///     textDirection: TextDirection.ltr,
///     color: Colors.blue,
///     start: true,
///   ),
///   child: // Your child widget goes here,
/// )
/// ```
class _DecorationPainter extends CustomPainter {
  /// Creates a [_DecorationPainter] with the specified parameters.
  ///
  /// The `textDirection` parameter is required to determine the positioning
  /// of the colored rectangle based on the text direction.
  ///
  /// The `color` parameter defines the color of the rectangle to be painted.
  ///
  /// The `start` parameter is a boolean value indicating whether the rectangle
  /// should be drawn at the start (left for LTR, right for RTL) or at the zero
  /// position of the canvas.
  _DecorationPainter({
    required this.textDirection,
    required this.color,
    required this.start,
  });

  /// The text direction to determine the positioning of the
  ///   colored rectangle. The rectangle will be drawn on either the left or
  ///   right side based on the text direction.
  final TextDirection textDirection;

  /// The color of the rectangle to be painted on the canvas.
  final Color? color;

  /// A boolean value indicating whether the rectangle should be drawn
  ///   at the start (left for LTR, right for RTL) or at the zero position of
  ///   the canvas.
  final bool start;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width / 2;
    final height = size.height;

    final painter = Paint();

    if (color != null) {
      painter.color = color!;
    }

    late final Offset offset;
    switch (textDirection) {
      case TextDirection.ltr:
        if (start) {
          offset = Offset(width, 0);
        } else {
          offset = Offset.zero;
        }
        break;
      case TextDirection.rtl:
        if (start) {
          offset = Offset.zero;
        } else {
          offset = Offset(width, 0);
        }
        break;
    }

    canvas.drawRect(offset & Size(width, height), painter);
  }

  @override
  bool shouldRepaint(covariant _DecorationPainter oldDelegate) {
    return oldDelegate.textDirection != textDirection ||
        oldDelegate.color != color ||
        oldDelegate.start != start;
  }
}
