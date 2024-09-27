import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_state.dart';
import 'package:book_doc/features/appointments/presentation/widgets/appointment_item.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      bloc: cubit..getCompletedAppointments(),
      builder: (context, state) {
        if (state is AppointmentLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainBlue,
            ),
          );
        } else if (state is GetCompletedAppointmentsErrorStateState) {
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
                itemBuilder: (context, index) => AppointmentItem(
                    appointment: cubit.completedAppointmentsList[index]),
                separatorBuilder: (context, index) => verticalSpace(12),
                itemCount: cubit.completedAppointmentsList.length),
          );
        }
      },
    );
  }
}
