import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_state.dart';
import 'package:book_doc/features/appointments/presentation/widgets/appointment_tab_list.dart';
import 'package:book_doc/features/appointments/presentation/widgets/cancelled_list.dart';
import 'package:book_doc/features/appointments/presentation/widgets/completed_list.dart';
import 'package:book_doc/features/appointments/presentation/widgets/upcoming_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyAppointmentsScreen extends StatelessWidget {
  const MyAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: Column(
            children: [
              Text(
                'My Appointments',
                style: TextStyles.font18DarkBlueSemiBold,
              ),
              verticalSpace(30),
              const Expanded(
                child: AppointmentTabList(
                  upcomingContent: UpcomingList(),
                  completedContent: CompletedList(),
                  cancelledContent: CancelledList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
