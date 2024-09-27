import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_state.dart';
import 'package:book_doc/features/appointments/presentation/widgets/upcoming_appointment_item.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';

class UpcomingList extends StatelessWidget {
  const UpcomingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      bloc: cubit..getUpcomingAppointments(),
      builder: (context, state) {
        if (state is AppointmentLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainBlue,
            ),
          );
        } else if (state is GetUpcomingAppointmentsErrorStateState) {
          return Center(
            child: Text(
              S.of(context).Error(state.error.toString()),
              style: TextStyles.font13DarkBlueMedium,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: ListView.separated(
              itemBuilder: (context, index) => UpcomingAppointmentItem(
                appointment: cubit.upcomingAppointmentsList[index],
                onPressed: () {
                  cubit.updateAppointmentStatus(
                      id: cubit.upcomingAppointmentsList[index].id,
                      status: S.of(context).Appointment_Cancelled);
                  cubit.getUpcomingAppointments();
                },
              ),
              separatorBuilder: (context, index) => verticalSpace(15),
              itemCount: cubit.upcomingAppointmentsList.length,
            ),
          );
        }
      },
    );
  }
}
