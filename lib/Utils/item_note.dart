import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemNote extends StatefulWidget {
  final List<String> dNote;

  const ItemNote({Key? key, required this.dNote}) : super(key: key);

  @override
  State<ItemNote> createState() => _ItemNoteState();
}

class _ItemNoteState extends State<ItemNote> {
  // Function to convert 24-hour format to 12-hour format
  String convertTo12HourFormat(String time24) {
    try {
      // Parse the time in 24-hour format
      DateTime time = DateFormat.Hm().parse(time24);

      // Format the time in 12-hour format
      return DateFormat.jm().format(time);
    } catch (e) {
      // Handle parsing errors
      return 'Invalid Time';
    }
  }

  // Function to convert month number to abbreviation
  String getMonthAbbreviation(String month) {
    switch (int.parse(month)) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    String monthAbbreviation = getMonthAbbreviation(widget.dNote[2]);
    String formattedTime = convertTo12HourFormat(widget.dNote[5]);

    return Container(
      padding: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.pinkAccent,
            ),
            child: Column(
              children: [
                Text(
                  monthAbbreviation,
                  style: TextStyle(color: Colors.white70),
                ),
                Text(
                  widget.dNote[3], // Day
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  widget.dNote[4], // Year
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.dNote[0], // Title
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      formattedTime, // Converted 12-hour format time
                      style: TextStyle(fontWeight: FontWeight.w200),
                    ),
                  ],
                ),
                Text(
                  widget.dNote[1], // Description
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    height: 1,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
