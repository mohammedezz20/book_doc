import 'package:book_doc/core/helpers/spacing.dart';
import 'package:book_doc/core/theme/app_colors.dart';
import 'package:book_doc/core/widgets/app_text_field.dart';
import 'package:book_doc/features/search/presentation/cubit/search_cubit.dart';
import 'package:book_doc/features/search/presentation/cubit/search_state.dart';
import 'package:book_doc/features/search/presentation/widgets/result_list.dart';
import 'package:book_doc/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SearchCubit.get(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          return Column(
            children: [
              Text(
                S.of(context).Search,
                style: TextStyles.font18DarkBlueSemiBold,
              ),
              verticalSpace(30),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      cubit.searchController.text = '';
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.moreLighterGray,
                      ),
                      child: const Icon(Icons.clear),
                    ),
                  ),
                  horizontalSpace(5),
                  Expanded(
                    child: SizedBox(
                      height: 52.h,
                      child: AppTextFormField(
                        borderRadius: 30,
                        controller: cubit.searchController,
                        hintText: S.of(context).search_for_doctors,
                        onTapOutside: (p0) {
                          cubit.search();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ),
                  horizontalSpace(5),
                  GestureDetector(
                    onTap: () {
                      cubit.search();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5.r),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsManager.moreLighterGray,
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
              verticalSpace(30),
              state is SearchSuccessState
                  ? Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).founds(cubit.searchResults.length),
                            style: TextStyles.font18DarkBlueSemiBold,
                          ),
                          verticalSpace(10),
                          Expanded(
                            child: SearchResultsList(
                                resultsList: cubit.searchResults),
                          ),
                        ],
                      ),
                    )
                  : cubit.searchResults.isEmpty
                      ? Center(
                          child: Text(
                            S.of(context).There_is_no_doctor_with_this_name,
                            style: TextStyles.font13DarkBlueRegular,
                          ),
                        )
                      : state is SearchErrorState
                          ? Column(
                              children: [
                                Text(
                                  state.error,
                                  style: TextStyles.font13DarkBlueRegular,
                                ),
                                verticalSpace(30),
                              ],
                            )
                          : state is SearchLoadingState
                              ? const Center(child: CircularProgressIndicator())
                              : Center(
                                  child: Text(
                                    S.of(context).Search_for_doctors,
                                    style: TextStyles.font14LightGrayRegular,
                                  ),
                                ),
            ],
          );
        },
      ),
    );
  }
}
