import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Ui/HomeScreen/WatchList/SavedMovieWidget.dart';
import 'package:movies_app/model/detail/Details.dart';
import 'package:movies_app/network/firestore.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("WatchList",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
                color: Colors.white,
              )),
          Expanded(
            child: StreamBuilder<QuerySnapshot<Details>>(
                stream: FireStoreUtils.getRealTimeDataFromFireStore(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    const Center(child:
                    CircularProgressIndicator(color: Colors.white,));
                  }
                  if(snapshot.hasError || snapshot.data == null){
                    return Text(snapshot.error.toString());
                  }
                  var watchList = snapshot.data?.docs
                      .map((element) => element.data())
                      .toList();
                  return  Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              SavedMoviesWidget(model: watchList![index]),
                          separatorBuilder: (context, index) => const Divider(
                            thickness: 2,
                            color: Colors.white,
                          ),
                          itemCount: watchList?.length?? 0));

                }),
          ),


        ],
      ),
    );
  }

}
