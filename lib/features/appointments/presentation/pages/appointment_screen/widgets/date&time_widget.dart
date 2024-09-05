import 'package:book_doc/core/helpers/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/theme/app_fonts.dart';
import 'appointment_type_picker.dart';
import 'custom_date_picker.dart';
import 'custom_time_picker.dart';

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Select Date',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            // Text(
            //   'Set Manual',
            //   style: TextStyles.font12BlueRegular,
            // ),
          ],
        ),
        verticalSpace(24),
        CustomDatePicker(),
        verticalSpace(24),
        Text(
          'Available Time',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        verticalSpace(24),
        const TimeSlotPicker(),
        verticalSpace(24),
        Text(
          'Appointment Type',
          style: TextStyles.font18DarkBlueSemiBold,
        ),
        verticalSpace(24),
        const AppointmentTypePicker(),
      ],
    );
  }
}
