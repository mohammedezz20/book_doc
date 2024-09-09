import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/appointment/appointment_cubit.dart';
import '../../../cubit/appointment/appointment_state.dart';

class TimeSlotPicker extends StatelessWidget {
  TimeSlotPicker({super.key, this.currentTime});

  String? currentTime;
  @override
  Widget build(BuildContext context) {
    var cubit = AppointmentCubit.get(context);
    if (cubit.appointmentTime != currentTime) {
      cubit.selectAppointmentTime(currentTime ?? '08:00 AM');
    }
    return BlocBuilder<AppointmentCubit, AppointmentStates>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          itemCount: cubit.availableTimes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3.5,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final selectedTime = cubit.availableTimes[index];
            final isSelected = selectedTime == cubit.appointmentTime;
            return GestureDetector(
              onTap: () {
                cubit.selectAppointmentTime(selectedTime);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  selectedTime,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black54,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
