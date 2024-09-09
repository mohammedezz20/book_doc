import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/appointment/appointment_cubit.dart';
import '../../../cubit/appointment/appointment_state.dart';

class AppointmentTypePicker extends StatelessWidget {
  AppointmentTypePicker({super.key, this.currentType});

  String? currentType;

  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    if (cubit.appointmentType != currentType) {
      cubit.selectAppointmentType(currentType ?? 'In Person');
    }
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        return Column(
          children: cubit.appointmentTypes.map(
            (type) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[50],
                            child: Icon(
                              type.icon,
                              color: type.color,
                            ),
                          ),
                          horizontalSpace(10.w),
                          Text(
                            type.text,
                            style: TextStyles.font14GrayRegular
                                .copyWith(color: ColorsManager.darkBlue),
                          ),
                        ],
                      ),
                      Radio<String>(
                        value: type.text,
                        groupValue: cubit.appointmentType,
                        activeColor: ColorsManager.mainBlue,
                        onChanged: (value) {
                          cubit.selectAppointmentType(value!);
                        },
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  Divider(color: Colors.grey[200], thickness: 1.0),
                ],
              );
            },
          ).toList(),
        );
      },
    );
  }
}

class AppointmentType {
  final IconData icon;
  final String text;
  final Color color;

  AppointmentType({
    required this.icon,
    required this.text,
    required this.color,
  });
}
