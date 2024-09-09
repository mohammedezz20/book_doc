import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/features/appointments/presentation/widgets/appointment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../cubit/appointment/appointment_cubit.dart';
import '../cubit/appointment/appointment_state.dart';

class CancelledList extends StatelessWidget {
  const CancelledList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      bloc: cubit..getCancelledAppointments(),
      builder: (context, state) {
        if (state is AppointmentLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainBlue,
            ),
          );
        } else if (state is GetCancelledAppointmentsErrorStateState) {
          return Center(
            child: Text(
              "Error: ${state.error.toString()}",
              style: TextStyles.font13DarkBlueMedium,
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: ListView.separated(
                itemBuilder: (context, index) => AppointmentItem(
                    appointment: cubit.cancelledAppointmentsList[index]),
                separatorBuilder: (context, index) => verticalSpace(12),
                itemCount: cubit.cancelledAppointmentsList.length),
          );
        }
      },
    );
  }
}
