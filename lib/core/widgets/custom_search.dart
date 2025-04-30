import 'package:flutter/material.dart';

import '../utils/size_config.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: SizedBox(
            height: 50,
            width: SizeConfig.screenWidth,
            child: TextFormField(
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
                    onPressed: () {},
                    icon: Icon(Icons.search,
                        color: Colors.grey, size: SizeConfig.defaultSize! * 3)),
              ),
            )));
  }
}
