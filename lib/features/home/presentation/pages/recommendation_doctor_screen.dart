import 'package:book_doc/core/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/app_fonts.dart';
import '../cubit/home/home_cubit.dart';
import '../cubit/home/home_state.dart';
import '../widgets/doctor_card.dart';
import 'doctor_details_screen.dart';

class RecommendationDoctorScreen extends StatelessWidget {
  const RecommendationDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Recommended Doctors',
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  children: [
                    AppTextFormField(
                      hintText: 'Search',
                      validator: (value) {},
                    ),
                    verticalSpace(20),
                    Expanded(
                      child: ListView.separated(
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
                          separatorBuilder: (context, index) =>
                              verticalSpace(10),
                          itemCount: cubit.doctorsList.length),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
