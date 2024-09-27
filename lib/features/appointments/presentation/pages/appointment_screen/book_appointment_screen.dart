import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/summary_appointment_screen.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/date&time_widget.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/steps_list.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../home/domain/entities/doctor.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Book_Appointment,
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
              DateAndTimeWidget(),
              verticalSpace(20),
              AppTextButton(
                buttonText: S.of(context).Continue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryAppointmentScreen(
                        isBooking: true,
                        doctor: doctor,
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
