import 'package:book_doc/core/helpers/spacing.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_fonts.dart';
import '../../domain/entities/doctor.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: doctor.imageUrl!,
                width: 110.w,
                height: 152.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. ${doctor.name}',
                style: TextStyles.font18DarkBlueBold,
              ),
              Text(
                '${doctor.specialization} Specialist',
                style: TextStyles.font12GrayMedium,
              ),
              verticalSpace(12),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Text(
                    doctor.rating.toString(),
                    style: TextStyles.font12GrayMedium,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
