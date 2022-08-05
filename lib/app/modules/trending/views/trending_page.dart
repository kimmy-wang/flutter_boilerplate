import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/modules/trending/bloc/trending_bloc.dart';
import 'package:flutter_boilerplate/app/modules/trending/widgets/widgets.dart';
import 'package:trending_repository/trending_repository.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrendingBloc(
        trendingRepository: context.read<TrendingRepository>(),
      )..add(const TrendingSubscriptionRequested()),
      child: const TrendingView(),
    );
  }
}

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<TrendingBloc, TrendingState>(
          builder: (context, state) {
            if (state.status == TrendingStatus.loading) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status == TrendingStatus.failure) {
              return Text('Error');
            } else if (state.status == TrendingStatus.success) {
              if (state.trendings == null || state.trendings!.isEmpty) {
                return Text('Empty');
              } else {
                return ListView.builder(
                  itemCount: state.trendings!.length,
                  itemBuilder: (context, index) {
                    final trending = state.trendings![index];
                    return GestureDetector(
                      onTap: () {
                      },
                      child: RepositoryItem(
                        index: index + 1,
                        trending: trending,
                        last: index == state.trendings!.length - 1,
                      ),
                    );
                  },
                );
              }
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
