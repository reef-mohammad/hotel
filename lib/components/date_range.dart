import 'package:flutter/material.dart';
import 'package:hotel_database/components/date_between.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(DateRanges());

class DateRanges extends StatefulWidget {
  @override
  SelectedDateRange createState() => SelectedDateRange();
}

List<String> views = <String>['Month', 'Year'];

class SelectedDateRange extends State<DateRanges> {
  late String _startDate, _endDate;
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  void initState() {
    final DateTime today = DateTime.now();
    _startDate = DateFormat('dd, MMMM yyyy').format(today).toString();
    _endDate = DateFormat('dd, MMMM yyyy')
        .format(today.add(Duration(days: 3)))
        .toString();
    _controller.selectedRange =
        PickerDateRange(today, today.add(Duration(days: 3)));
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: PopupMenuButton<String>(
            icon: Icon(Icons.calendar_today),
            itemBuilder: (BuildContext context) => views.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList(),
            onSelected: (String value) {
              if (value == 'Month') {
                _controller.view = DateRangePickerView.month;
              } else if (value == 'Year') {
                _controller.view = DateRangePickerView.year;
              }
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  height: 50,
                  child: Text('StartRangeDate:' '$_startDate')),
              Container(height: 50, child: Text('EndRangeDate:' '$_endDate')),
              Container(height: 50, child: Text('EndRangeDate:' '$_endDate')),
              Card(
                margin: const EdgeInsets.fromLTRB(50, 40, 50, 100),
                child: SfDateRangePicker(
                  controller: _controller,
                  selectionMode: DateRangePickerSelectionMode.range,
                  onSelectionChanged: selectionChanged,
                  allowViewNavigation: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _startDate =
          DateFormat('dd, MMMM yyyy').format(args.value.startDate).toString();
      _endDate = DateFormat('dd, MMMM yyyy')
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    });
  }
}
