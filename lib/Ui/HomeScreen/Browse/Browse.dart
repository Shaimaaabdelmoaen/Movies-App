import 'package:flutter/material.dart';
import 'api/ApiManager.dart';
import 'genres.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Browse Category ",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
            FutureBuilder(
                future: ApiManager.getSources(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: Colors.white,
                    ));
                  }
                  if (snapshot.hasError || snapshot.data == null) {
                    return const Center(
                        child: Text(
                      "error",
                      style: TextStyle(color: Colors.white),
                    ));
                  }
                  var sourceList = snapshot.data?.genres;
                  return Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.all(30),
                        itemCount: sourceList?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 47,
                          mainAxisSpacing: 38,
                        ),
                        itemBuilder: (context, index) =>
                           GenreDetails(sourceList![index])),
                  );
                })
          ],
        ));
  }
}
