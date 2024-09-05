import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/features/app-layout/presentation/pages/app_layout.dart';
import 'package:book_doc/features/appointments/presentation/cubit/appointment/appointment_cubit.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/book_information_widget.dart';
import 'package:book_doc/features/appointments/presentation/pages/appointment_screen/widgets/confirmed_widget.dart';
import 'package:book_doc/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_fonts.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../home/domain/entities/doctor.dart';
import '../../cubit/appointment/appointment_state.dart';

class SummaryAppointmentScreen extends StatelessWidget {
  const SummaryAppointmentScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    return BlocConsumer<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Book Appointment',
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
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(child: ConfirmedWidget()),
                verticalSpace(40),
                BookInformationWidget(
                  date: cubit.appointmentDate,
                  time: cubit.appointmentTime,
                  type: cubit.appointmentType,
                ),
                verticalSpace(20),
                Text('Doctor Information',
                    style: TextStyles.font18DarkBlueSemiBold),
                verticalSpace(16),
                DoctorCard(doctor: doctor),
                const Spacer(),
                state is AppointmentLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                      ))
                    : AppTextButton(
                        buttonText: 'Book Now',
                        onPressed: () {
                          cubit.doctor = doctor;
                          cubit.bookAppointment();
                        }),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is BookAppointmentSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Appointment Booked Successfully'),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AppLayout(),
            ),
          );
        }
        if (state is BookAppointmentErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to Book Appointment'),
            ),
          );
        }
      },
    );
  }
}
