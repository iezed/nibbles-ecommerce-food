import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nibbles_ecommerce/presentation/widgets/package_item.dart';

import '../../application/blocs/packages/packages_bloc.dart';
import 'loading_ticker.dart';

Widget packagesList() {
  return BlocBuilder<PackagesBloc, PackagesState>(builder: (context, state) {
    if (state is PackagesLoaded) {
      return Column(
        children: List.generate(
          state.packages.length,
          // Number of PackageItem widgets
          (index) => PackageItem(
            isFromVerticalList: true,
            packageModel: state.packages[index],
          ),
        ),
      );
    } else {
      return const LoadingTicker();
    }
  });
}