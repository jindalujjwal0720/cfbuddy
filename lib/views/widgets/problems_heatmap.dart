import 'package:bloc1/business_logic/cubit/problems_heat_map_cubit.dart';
import 'package:bloc1/views/widgets/components/empty_states.dart';
import 'package:bloc1/views/widgets/components/error_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'dart:developer' as dev;

class ProblemsHeatMap extends StatelessWidget {
  const ProblemsHeatMap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProblemsHeatMapCubit, ProblemsHeatMapState>(
      builder: (context, state) {
        if (state is ProblemsHeatMapLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: HeatMap(
              colorMode: ColorMode.opacity,
              scrollable: true,
              colorsets: {
                1: Colors.green[700]!,
              },
              datasets: state.dataset,
              showColorTip: false,
            ),
          );
        } else if (state is ProblemsHeatMapError) {
          dev.log("Error: (Problem Heatmap widget) - ${state.message}");
          return const ErrorStates().basicErrorWidget(() {});
        } else {
          return const EmptyStates().emptyHeatmapWidget();
        }
      },
    );
  }
}
