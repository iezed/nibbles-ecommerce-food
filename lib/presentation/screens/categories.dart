import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nibbles_ecommerce/configs/configs.dart';
import 'package:nibbles_ecommerce/core/constants/assets.dart';
import 'package:nibbles_ecommerce/core/constants/colors.dart';
import 'package:nibbles_ecommerce/core/router/app_router.dart';
import 'package:nibbles_ecommerce/presentation/widgets/loading_ticker.dart';

import '../../application/blocs/categories/categories_bloc.dart';
import '../widgets/top_rec_components.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppDimensions.normalize(560),
          child: Stack(
            children: [
              /*Positioned(
                top: 0,
                left: 0,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      AppAssets.curvedRec,
                      colorFilter: const ColorFilter.mode(
                          AppColors.antiqueRuby, BlendMode.srcIn),
                      height: AppDimensions.normalize(145),
                      width: AppDimensions.normalize(170),
                    ),
                    Positioned(
                      top: AppDimensions.normalize(18),
                      right: AppDimensions.normalize(15),
                      child: SvgPicture.asset(
                        AppAssets.nibblesLogo,
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.srcIn),
                      ),
                    ),
                    Positioned(
                      top: AppDimensions.normalize(48),
                      left: AppDimensions.normalize(10),
                      child: Text(
                        "Meals".toUpperCase(),
                        style: AppText.h2b?.copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),*/
              curvedlRecSvg(AppColors.antiqueRuby),
              positionedWhiteLogo(),
              positionedTitle("Meals".toUpperCase()),
              Positioned(
                top: AppDimensions.normalize(60),
                bottom: -AppDimensions.normalize(8),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: Space.h1,
                  child: BlocBuilder<CategoriesBloc, CategoriesState>(
                    builder: (context, state) {
                      if (state is CategoriesLoading) {
                        return const Center(
                          child: LoadingTicker(),
                        );
                      }
                      if (state is CategoriesLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (int index = 0;
                                index < state.categories.length;
                                index++)
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRouter.meals,
                                      arguments: state.categories[index]);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    bottom: AppDimensions.normalize(9),
                                  ),
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        AppAssets.categoriesImages[index],
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: AppDimensions.normalize(48),
                                          height: AppDimensions.normalize(19),
                                          decoration: BoxDecoration(
                                            color: AppColors.deepTeal,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                AppDimensions.normalize(6),
                                              ),
                                              bottomRight: Radius.circular(
                                                AppDimensions.normalize(8),
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              state.categories[index]
                                                  .categoryname,
                                              style: AppText.h3b?.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text("Error"),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
