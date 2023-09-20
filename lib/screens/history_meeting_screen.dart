import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/extension/padding_extensions.dart';
import 'package:zoom_clone/resources/firestore_methods.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FireStoreMethods().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        // Convert the snapshot data to a List<dynamic>.
        List<dynamic> meetings = (snapshot.data! as dynamic).docs;

        // Sort the meetings list by date and time in descending order.
        meetings.sort((a, b) {
          DateTime dateTimeA = (a['createdAt'] as Timestamp).toDate();
          DateTime dateTimeB = (b['createdAt'] as Timestamp).toDate();

          // Compare first by date (newest to oldest), and if dates are the same, compare by time.
          int dateComparison = dateTimeB.compareTo(dateTimeA);

          if (dateComparison == 0) {
            return dateTimeB.hour.compareTo(dateTimeA.hour);
          }

          return dateComparison;
        });

        return ListView.builder(
          itemCount: meetings.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                'Room Name: ${meetings[index]['meetingName']}',
              ).pB(3.h),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Joined On ${DateFormat.yMMMd().format(
                    (meetings[index]['createdAt'] as Timestamp).toDate(),
                  )}'),
                  Text('Time: ${DateFormat('h:mm a').format(
                    (meetings[index]['createdAt'] as Timestamp).toDate(),
                  )}')
                      .pR(10.w),
                ],
              ),
            ).pB(7.h);
          },
        );
      },
    );
  }
}
