import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import './conf.dart';

void main() => runApp(TWComp());

class TWComp extends StatefulWidget {
  @override
  _TWCompState createState() => _TWCompState();
}

class _TWCompState extends State<TWComp> {
  double monthlySalary = 0.0;
  double daysPerWeek = DEFAULT_DAYS_PER_WEEK;
  double daily = 0;
  double hourly = 0;
  double overTime = 0;
  double restDay = 0;
  double publicHoliday = 0;

  calculate() {
    daily = (monthlySalary * 12) / (52 * daysPerWeek);
    hourly = (monthlySalary * 12) / (52 * 44);
    overTime = hourly * 1.5;
    restDay = daily * 2;
    publicHoliday = daily;
  }

  @override
  Widget build(BuildContext contex) {
    return MaterialApp(
        theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(TEXT_TITLE),
        ),
        body: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Row(children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(TEXT_SALARY),
                    padding: EdgeInsets.all(5),
                  ),
                  flex: 7,
                ),
                Expanded(
                    child: Container(
                      child: Text(TEXT_DAYS_PER_WEEK),
                      padding: EdgeInsets.all(5),
                    ),
                    flex: 3),
              ]),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: '0',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          setState(() {
                            monthlySalary = text == '' ? 0 : double.parse(text);
                            calculate();
                          });
                        },
                        inputFormatters: [
                          WhitelistingTextInputFormatter(
                            RegExp(
                              INPUT_PATTERN,
                            ),
                          ),
                        ],
                        keyboardType: TextInputType.number,
                      ),
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: TextField(
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          hintText: '$daysPerWeek',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (text) {
                          setState(() {
                            daysPerWeek = text == ''
                                ? DEFAULT_DAYS_PER_WEEK
                                : double.parse(text);
                            calculate();
                          });
                        },
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          WhitelistingTextInputFormatter(
                            RegExp(
                              INPUT_PATTERN,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(5),
                    ),
                  ),
                ],
              ),
              ResultCard(
                monthlySalary: monthlySalary.toStringAsFixed(2),
                daysPerWeek: daysPerWeek.toStringAsFixed(2),
                totalAmount: daily.toStringAsFixed(2),
                title: TITLE_DAILY,
                description: FORMULA_DAILY
                    .replaceAll('%monthlySalary', monthlySalary.toStringAsFixed(2))
                    .replaceAll('%daysPerWeek', daysPerWeek.toStringAsFixed(2)),
                lawTitle: LAW_TITLE_DAILY,
                lawText: TEXT_LAW_DAILY,
                lawUrl: URL_DAILY,
              ),
              Divider(
                color: Colors.grey,
              ),
              ResultCard(
                monthlySalary: monthlySalary.toStringAsFixed(2),
                daysPerWeek: daysPerWeek.toStringAsFixed(2),
                totalAmount: hourly.toStringAsFixed(2),
                title: TITLE_HOURLY,
                description: FORMULA_HOURLY
                    .replaceAll('%monthlySalary', monthlySalary.toStringAsFixed(2)),
                lawTitle: LAW_TITLE_HOURLY,
                lawText: TEXT_LAW_HOURLY,
                lawUrl: URL_HOURLY,
              ),
              Divider(
                color: Colors.grey,
              ),
              ResultCard(
                monthlySalary: monthlySalary.toStringAsFixed(2),
                daysPerWeek: daysPerWeek.toStringAsFixed(2),
                totalAmount: overTime.toStringAsFixed(2),
                title: TITLE_OVERTIME,
                description: FORMULA_OVERTIME
                    .replaceAll('%hourly', hourly.toStringAsFixed(2)),
                lawTitle: LAW_TITLE_OVERTIME,
                lawText: TEXT_LAW_OVERTIME,
                lawUrl: URL_OVERTIME,
              ),
              Divider(
                color: Colors.grey,
              ),
              ResultCard(
                monthlySalary: monthlySalary.toStringAsFixed(2),
                daysPerWeek: daysPerWeek.toStringAsFixed(2),
                totalAmount: restDay.toStringAsFixed(2),
                title: TITLE_RESTDAY,
                description: FORMULA_RESTDAY.replaceAll('%daily', daily.toStringAsFixed(2)),
                lawTitle: LAW_TITLE_RESTDAY,
                lawText: TEXT_LAW_RESTDAY,
                lawUrl: URL_RESTDAY,
              ),
              Divider(
                color: Colors.grey,
              ),
              ResultCard(
                monthlySalary: monthlySalary.toStringAsFixed(2),
                daysPerWeek: daysPerWeek.toStringAsFixed(2),
                totalAmount: publicHoliday.toStringAsFixed(2),
                title: LAW_TITLE_PUBLIC_HOLIDAY,
                description: FORMULA_PUBLIC_HOLIDAY
                  .replaceAll('%monthlySalary', monthlySalary.toStringAsFixed(2))
                  .replaceAll('%daysPerWeek', daysPerWeek.toStringAsFixed(2)),
                lawTitle: LAW_TITLE_PUBLIC_HOLIDAY,
                lawText: TEXT_LAW_PUBLIC_HOLIDAY,
                lawUrl: URL_PUBLIC_HOLIDAY,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 60, right: 45, left: 45),
                child: Text(
                  TEXT_DISCLAIMER,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultCard extends StatelessWidget {
  final String monthlySalary;
  final String daysPerWeek;
  final String totalAmount;
  final String title;
  final String description;
  final String lawTitle;
  final String lawText;
  final String lawUrl;

  ResultCard({
    this.monthlySalary,
    this.daysPerWeek,
    this.totalAmount,
    this.title,
    this.description,
    this.lawTitle,
    this.lawText,
    this.lawUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Column(
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ShowLaw(
                                lawText: lawText,
                                lawUrl: lawUrl,
                                lawTitle: lawTitle,
                              );
                            });
                      },
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  totalAmount,
                  style: TextStyle(
                    color: Color.fromARGB(255, 219, 93, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShowLaw extends StatelessWidget {
  final String lawTitle;
  final String lawUrl;
  final String lawText;

  ShowLaw({this.lawTitle, this.lawText, this.lawUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AlertDialog(
        title: Text(lawTitle),
        content: Text(lawText),
        actions: <Widget>[
          FlatButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('Link'),
            onPressed: () async {
              if (await canLaunch(lawUrl)) {
                await launch(lawUrl);
              } else {
                throw 'Could not launch $lawUrl';
              }
            },
          ),
        ],
      ),
    );
  }
}
