import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/widgets/app_text_button.dart';
import 'package:book_doc/features/home/presentation/widgets/about_me_widget.dart';
import 'package:book_doc/features/home/presentation/widgets/doctor_card.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_fonts.dart';
import '../../../appointments/presentation/pages/appointment_screen/book_appointment_screen.dart';
import '../../domain/entities/doctor.dart';
import '../widgets/tab_list_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Dr(doctor.name ?? ""),
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    // Custom App Bar
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          DoctorCard(doctor: doctor),
                          verticalSpace(20),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      child: DoctorDetailsTabListWidget(
                        aboutContent: AboutMeWidget(doctor: doctor),
                        locationContent: Container(),
                        reviewsContent: Container(),
                      ),
                    ),
                  ],
                ),
              ),
              AppTextButton(
                buttonText: S.of(context).Make_An_Appointment,
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookAppointmentScreen(
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
