import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/features/home/domain/entities/doctor.dart';
import 'package:book_doc/features/home/presentation/pages/doctor_details_screen.dart';
import 'package:book_doc/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class SearchResultsList extends StatelessWidget {
  const SearchResultsList({super.key, required this.resultsList});

  final List<Doctor> resultsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DoctorDetailsScreen(doctor: resultsList[index])));
        },
        child: DoctorCard(
          doctor: resultsList[index],
        ),
      ),
      separatorBuilder: (context, index) => verticalSpace(12),
      itemCount: resultsList.length,
    );
  }
}
