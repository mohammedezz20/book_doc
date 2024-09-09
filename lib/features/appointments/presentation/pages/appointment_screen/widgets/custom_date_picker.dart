import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../cubit/appointment/appointment_cubit.dart';
import '../../../cubit/appointment/appointment_state.dart';
import 'date_item.dart';

class CustomDatePicker extends StatelessWidget {
  CustomDatePicker({super.key, this.initialDate});

  final int daysToShow = 7;
  final DateTime maxDate = DateTime.now().add(const Duration(days: 6));
  DateTime? initialDate;
  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    if (cubit.appointmentDate != initialDate) {
      cubit.setAppointmentDate(initialDate ?? DateTime.now());
    }

    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cubit.appointmentDate.day == DateTime.now().day
                ? Container()
                : IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: cubit.scrollToPreviousDate,
                  ),
            Expanded(
              child: SizedBox(
                height: 70.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: daysToShow,
                  itemBuilder: (context, index) {
                    DateTime dateToShow =
                        cubit.currentDate.add(Duration(days: index));
                    bool isSelected =
                        dateToShow.day == cubit.appointmentDate.day &&
                            dateToShow.month == cubit.appointmentDate.month &&
                            dateToShow.year == cubit.appointmentDate.year;

                    return GestureDetector(
                      onTap: () {
                        cubit.selectAppointmentDate(dateToShow);
                      },
                      child: DateItem(
                        dateToShow: dateToShow,
                        isSelected: isSelected,
                      ),
                    );
                  },
                ),
              ),
            ),
            !cubit.appointmentDate.isBefore(maxDate)
                ? Container()
                : IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: cubit.scrollToNextDate,
                  ),
          ],
        );
      },
    );
  }
}
