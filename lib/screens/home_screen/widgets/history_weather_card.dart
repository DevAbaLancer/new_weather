import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:new_weather/utils/styles.dart';

class HistoryWeatherCard extends StatelessWidget {
  final String? image;
  final double? temp;
  final String? description;
  final int? humidity;
  final double? feelsLike;
  final int? date;

  const HistoryWeatherCard({
    Key? key,
    this.humidity,
    this.image,
    this.temp,
    this.description,
    this.feelsLike,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTextTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
            child: Text(
              'Yesterday\'s weather',
              style: Styles.cardTS,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
            child: Text(
              //DateTime.parse(timestamp.toDate().toString())
              DateFormat.yMMMMEEEEd().format(
                DateTime.fromMillisecondsSinceEpoch((date!) * 1000),
              ),
              style: Styles.cardSubtitleTS,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                    'http://openweathermap.org/img/wn/$image@2x.png'),
              ),
              Text(
                '$temp°',
                style: Styles.cardBigTS,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      child: Text(
                        description ?? '',
                        style: Styles.cardSubtitleTS.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      child: Text(
                        'Humidity $humidity%',
                        style: Styles.cardSubtitleTS.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
                      child: Text(
                        'Feels like $feelsLike',
                        style: Styles.cardSubtitleTS.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
