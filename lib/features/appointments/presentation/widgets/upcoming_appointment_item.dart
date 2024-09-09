import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/features/appointments/domain/entities/appointment_model.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/reschedule_appointment_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';

class UpcomingAppointmentItem extends StatelessWidget {
  const UpcomingAppointmentItem(
      {super.key, required this.appointment, required this.onPressed});

  final AppointmentModel appointment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.w),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: appointment.doctor.imageUrl ?? '',
                  width: 74.w,
                  height: 90.h,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                        Text(
                          DateFormat.MMMMEEEEd()
                              .format(appointment.appointmentDate.toDate()),
                          style: TextStyles.font12GrayMedium,
                        ),
                        horizontalSpace(5),
                        Text(
                          '|',
                          style: TextStyles.font12GrayMedium,
                        ),
                        horizontalSpace(5),
                        Text(
                          appointment.appointmentTime,
                          style: TextStyles.font12GrayMedium,
                        ),
                      ],
                    ),
                    verticalSpace(10),
                    Row(
                      children: [
                        appointment.appointmentType == 'In Person'
                            ? Icon(
                                Icons.person,
                                color: Colors.lightBlueAccent,
                                size: 20.r,
                              )
                            : appointment.appointmentType == 'Video Call'
                                ? Icon(
                                    Icons.videocam,
                                    color: Colors.lightGreen,
                                    size: 20.r,
                                  )
                                : Icon(
                                    Icons.phone_in_talk,
                                    color: Colors.red,
                                    size: 20.r,
                                  ),
                        horizontalSpace(5),
                        Text(
                          appointment.appointmentType,
                          style: TextStyles.font12GrayMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(8),
          const Divider(
            color: ColorsManager.lighterGray,
          ),
          verticalSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: AppTextButton(
                  buttonText: 'Cancel Appointment',
                  onPressed: onPressed,
                  backgroundColor: Colors.white,
                  textStyle: TextStyles.font13BlueSemiBold,
                  borderRadius: 24.r,
                ),
              ),
              horizontalSpace(16),
              Expanded(
                child: AppTextButton(
                  buttonText: 'Reschedule',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RescheduleAppointmentScreen(
                            appointment: appointment),
                      ),
                    );
                  },
                  textStyle: TextStyles.font13BlueSemiBold
                      .copyWith(color: Colors.white),
                  borderRadius: 25.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
