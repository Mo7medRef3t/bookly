import 'dart:async';
import 'package:bookly/features/home/presentation/manger/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/size_config.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        context.read<SearchedBooksCubit>().fetchSearchedBooks(query.trim());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: SizeConfig.screenWidth,
      child: TextFormField(
        controller: searchController,
        style: const TextStyle(color: Colors.black, fontSize: 18),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          filled: true,
          suffixIcon: IconButton(
            onPressed: () {
              if (searchController.text.isNotEmpty) {
                context
                    .read<SearchedBooksCubit>()
                    .fetchSearchedBooks(searchController.text.trim());
              }
            },
            icon: Icon(
              Icons.search,
              color: Colors.grey,
              size: SizeConfig.defaultSize! * 3,
            ),
          ),
        ),
        onChanged: _onSearchChanged,
        
      ),
    );
  }
}