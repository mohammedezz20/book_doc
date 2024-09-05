import 'package:book_doc/core/assets/vectors/vectors.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_fonts.dart';

class BookInformationWidget extends StatelessWidget {
  const BookInformationWidget(
      {super.key, required this.date, required this.time, required this.type});

  final DateTime date;
  final String time;
  final String type;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AppointmentCubit>();
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Book Information',
              style: TextStyles.font18DarkBlueSemiBold,
            ),
            verticalSpace(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffEAF2FF),
                  radius: 25.r,
                  child: Icon(
                    Icons.date_range_outlined,
                    color: ColorsManager.mainBlue,
                    size: 24.r,
                  ),
                ),
                horizontalSpace(12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Date & Time',
                      style: TextStyles.font14BlueSemiBold
                          .copyWith(color: ColorsManager.darkBlue),
                    ),
                    verticalSpace(4),
                    Text(
                      DateFormat.yMMMMEEEEd().format(cubit.appointmentDate),
                      style: TextStyles.font12GrayRegular,
                    ),
                    verticalSpace(4),
                    Text(
                      cubit.appointmentTime,
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(16),
            const Divider(
              thickness: 1,
              color: ColorsManager.lightGray,
            ),
            verticalSpace(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xffE9FAEF),
                  radius: 25.r,
                  child: SvgPicture.asset(
                    AppVector.clipboard,
                    height: 24.h,
                    width: 24.w,
                  ),
                ),
                horizontalSpace(12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointment Type',
                      style: TextStyles.font14BlueSemiBold
                          .copyWith(color: ColorsManager.darkBlue),
                    ),
                    verticalSpace(4),
                    Text(
                      cubit.appointmentType,
                      style: TextStyles.font12GrayRegular,
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(16),
            const Divider(
              thickness: 1,
              color: ColorsManager.lightGray,
            ),
          ],
        );
      },
    );
  }
}
