import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/category_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(10),
        Text(
          'Hi, ${FirebaseAuth.instance.currentUser!.displayName!} !',
          style: TextStyles.font18DarkBlueBold,
        ),
        verticalSpace(20),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            'Doctor Speciality',
            style: TextStyles.font18DarkBlueSemiBold,
          ),
          trailing: InkWell(
            onTap: () {},
            child: Text(
              'See All',
              style: TextStyles.font12BlueRegular,
            ),
          ),
        ),
        verticalSpace(10),
        CategoryList(),
      ],
    );
  }
}
