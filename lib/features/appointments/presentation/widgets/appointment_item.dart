import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: ColorsManager.lighterGray,
            spreadRadius: 0,
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                appointment.status,
                style: TextStyles.font12GrayRegular.copyWith(
                  color: appointment.status == 'Appointment Completed'
                      ? ColorsManager.green
                      : Colors.red,
                ),
              ),
              verticalSpace(6),
              Row(
                children: [
                  Text(
                    DateFormat.yMMMMEEEEd().format(
                      // Handle Timestamp to DateTime conversion if needed
                      appointment.appointmentDate.toDate(),
                    ),
                    style: TextStyles.font12GrayMedium,
                  ),
                  horizontalSpace(10),
                  Text(
                    '|',
                    style: TextStyles.font12GrayMedium,
                  ),
                  horizontalSpace(10),
                  Text(
                    appointment.appointmentTime,
                    style: TextStyles.font12GrayMedium,
                  ),
                  horizontalSpace(10),
                ],
              ),
            ],
          ),
          verticalSpace(6),
          const Divider(
            color: ColorsManager.lighterGray,
          ),
          verticalSpace(6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: appointment.doctor.imageUrl ?? '',
                  // Handle null case
                  width: 75.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error), // Error handling
                ),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(6),
                  Text(
                    'Dr. ${appointment.doctor.name}',
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  Text(
                    '${appointment.doctor.specialization} Specialist',
                    style: TextStyles.font12GrayMedium,
                  ),
                  verticalSpace(12),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        appointment.doctor.rating.toString(),
                        style: TextStyles.font12GrayMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
