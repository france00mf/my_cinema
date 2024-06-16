import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cinema/core/resources/app_colors.dart';
import 'package:my_cinema/core/resources/app_values.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_bloc.dart';
import 'package:my_cinema/search/presenter/controller/search_bloc/search_event.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      child: TextFormField(
        controller: _textController,
         cursorColor: AppColors.primaryText,
        cursorWidth: AppSize.s1,
        style: textTheme.bodyLarge,
        onChanged: (title){
          context.read<SearchBloc>().add(GetSearchEvent(title));
        },
         decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColors.primaryText,
            ),
            borderRadius: BorderRadius.circular(AppSize.s8),
          )),
      ));
  }
}