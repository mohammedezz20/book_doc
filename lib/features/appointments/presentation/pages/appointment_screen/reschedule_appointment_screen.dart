import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/summary_appointment_screen.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/date&time_widget.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/steps_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_fonts.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../domain/entities/appointment_model.dart';

class RescheduleAppointmentScreen extends StatelessWidget {
  const RescheduleAppointmentScreen({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reschedule Appointment',
          style: TextStyles.font18DarkBlueBold,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StepsList(),
              verticalSpace(20),
              DateAndTimeWidget(appointment: appointment),
              verticalSpace(20),
              AppTextButton(
                buttonText: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryAppointmentScreen(
                        doctor: appointment.doctor,
                        isBooking: false,
                        currentAppointment: appointment,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
