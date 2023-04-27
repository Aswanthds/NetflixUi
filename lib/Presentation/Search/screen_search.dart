import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_ui/Presentation/Search/widgets/search_idle.dart';
import 'package:netflix_ui/Presentation/Search/widgets/search_result.dart';
import 'package:netflix_ui/application/search/searchresult_bloc.dart';
import 'package:netflix_ui/core/colors.dart';
import 'package:netflix_ui/core/constants.dart';
import 'package:easy_debounce/easy_debounce.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});

  

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        BlocProvider.of<SearchresultBloc>(context)
            .add(const SearchresultEvent.initialize());
      },
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    CupertinoIcons.xmark_circle_fill,
                    color: Colors.grey,
                  ),
                  style: TextStyle(color: Colors.grey[200]),
                  onChanged: (value) {
                    EasyDebounce.debounce(
                        'search', Duration(milliseconds: 1 * 1000), () {
                      BlocProvider.of<SearchresultBloc>(context)
                          .add(SearchMovies(movieQuery: value));
                    });
                    // BlocProvider.of<SearchresultBloc>(context)
                    //     .add(SearchMovies(movieQuery: value));
                  }),
              kHeight,
              Expanded(child: BlocBuilder<SearchresultBloc, SearchresultState>(
                builder: (context, state) {
                  if (state.searchResultList.isEmpty) {
                    return SearchIdleWidget();
                  } else {
                    return SearchResultWidget();
                  }
                },
              )),
              // Expanded(child: SearchResultWidget())
            ],
          ),
        ),
      ),
    );
  }
}
