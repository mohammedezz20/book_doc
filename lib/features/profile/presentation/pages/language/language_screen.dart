import 'package:book_doc/features/profile/presentation/cubit/language/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_fonts.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'Languages',
                  style: TextStyles.font18DarkBlueBold,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                elevation: 0,
                centerTitle: true,
                backgroundColor: Colors.white,
              ),
              backgroundColor: Colors.white,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Arabic',
                          style: TextStyles.font16DarkBlueMedium,
                        ),
                        const Spacer(),
                        Radio<String>(
                          value: 'ar',
                          groupValue: state.selectedLanguage.languageCode,
                          activeColor: ColorsManager.mainBlue,
                          onChanged: (value) {
                            context
                                .read<LanguageCubit>()
                                .changeLanguage(Locale(value!));
                          },
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey[300],
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Text(
                          'English',
                          style: TextStyles.font16DarkBlueMedium,
                        ),
                        const Spacer(),
                        Radio<String>(
                          value: 'en',
                          groupValue: state.selectedLanguage.languageCode,
                          activeColor: ColorsManager.mainBlue,
                          onChanged: (value) {
                            context
                                .read<LanguageCubit>()
                                .changeLanguage(Locale(value!));
                          },
                        ),
                      ],
                    ),
                    verticalSpace(12),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey[300],
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
