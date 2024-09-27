import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_fonts.dart';
import '../../domain/entities/doctor.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor, this.width, this.height});

  final double? width;
  final double? height;
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: doctor.imageUrl!,
              width: width?.w ?? 95.w,
              height: height?.h ?? 120.h,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          horizontalSpace(16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).Dr(doctor.name ?? ""),
                style: TextStyles.font16DarkBlueMedium
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              verticalSpace(7),
              Text(
                S.of(context).Specialist(doctor.specialization ?? ""),
                style: TextStyles.font12GrayMedium,
              ),
              verticalSpace(7),
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
