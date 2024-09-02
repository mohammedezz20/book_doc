import 'package:book_doc/features/home/presentation/manager/home_cubit.dart';
import 'package:book_doc/features/home/presentation/manager/home_state.dart';
import 'package:book_doc/features/home/presentation/pages/doctor_details_screen.dart';
import 'package:book_doc/features/home/presentation/pages/recommendation_doctor_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';
import 'doctor_card.dart';

class RecommendationList extends StatelessWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Recommendation Doctor',
                style: TextStyles.font18DarkBlueSemiBold,
              ),
              trailing: InkWell(
                onTap: () {
                  // TODO: Get recommended doctors.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (BuildContext context) =>
                            HomeCubit()..getDoctors(),
                        child: const RecommendationDoctorScreen(),
                      ),
                    ),
                  );
                },
                child: Text(
                  'See All',
                  style: TextStyles.font12BlueRegular,
                ),
              ),
            ),
            verticalSpace(16),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailsScreen(
                          doctor: cubit.doctorsList[index],
                        ),
                      ),
                    );
                  },
                  child: DoctorCard(
                    doctor: cubit.doctorsList[index],
                  ),
                ),
                itemCount: cubit.doctorsList.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
