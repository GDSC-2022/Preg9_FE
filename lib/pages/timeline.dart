import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EventTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('YOUR TIMELINE',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8),
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            _buildTimelineTile(
                indicator: const _IconIndicator(
                  iconData: Icons.medical_services,
                  size: 20,
                ),
                date: 'March 3',
                time: '5:00 - 6:00 pm',
                doctorPatientName: 'Amy',
                eventTitle: 'Prenatal Checkup',
                isFirst: true),
            _buildTimelineTile(
                indicator: const _IconIndicator(
                  iconData: Icons.medical_services,
                  size: 20,
                ),
                date: 'March 5',
                time: '10: 30 - 11: 00 am',
                doctorPatientName: 'Bob',
                eventTitle: 'Online Meeting',
                isLast: true),
          ],
        ));
  }
}

TimelineTile _buildTimelineTile({
  required _IconIndicator indicator,
  required String date,
  required String time,
  required String eventTitle,
  required String doctorPatientName,
  bool isLast = false,
  bool isFirst = false,
}) {
  return TimelineTile(
    alignment: TimelineAlign.manual,
    lineXY: 0.3,
    beforeLineStyle: const LineStyle(color: Color.fromARGB(255, 182, 3, 107)),
    indicatorStyle: IndicatorStyle(
      indicatorXY: 0.3,
      drawGap: true,
      width: 30,
      height: 30,
      indicator: indicator,
    ),
    isLast: isLast,
    isFirst: isFirst,
    startChild: Center(
      child: Container(
        alignment: const Alignment(0.0, -0.50),
        child: Text(
          date,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    ),
    endChild: Padding(
      padding: const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            eventTitle,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'with $doctorPatientName',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black.withOpacity(0.8),
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    ),
  );
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    required this.iconData,
    required this.size,
  });

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 182, 3, 107),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Icon(iconData,
                  size: size, color: const Color.fromARGB(255, 236, 220, 226)),
            ),
          ),
        ),
      ],
    );
  }
}
