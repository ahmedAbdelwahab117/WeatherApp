import 'package:flutter/material.dart';
import 'package:weather/screens/Search_Page.dart';
import 'package:weather/utils/app_color.dart';

class NoWeather extends StatelessWidget {
  const NoWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'there is no weather , starting',
            style: TextStyle(fontSize: 28),
          ),
          Row(
            children: [
              const Text(
                'search now',
                style: TextStyle(
                  fontSize: 28,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ));
                },
                icon: const Icon(Icons.search),
                color: AppColors.black,
                iconSize: 32,
              )
            ],
          ),
        ],
      ),
    );
  }
}
