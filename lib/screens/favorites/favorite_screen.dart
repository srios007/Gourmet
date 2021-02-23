import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/components/components.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/model/models.dart';
import 'package:gourmet/screens/screens.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen>
 //   with AutomaticKeepAliveClientMixin<FavoriteScreen>
{
  List<Restaurant> restaurantsList = [];
  bool isLoading = false;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    _getRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Palette.white,
          centerTitle: true,
          title: Text(
            'Favoritos',
            style: GoogleFonts.poppins(textStyle: Styles.kTituloPremium),
          ),
        ),
        body: RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _getRestaurants,
      color: Palette.gourmet,
      backgroundColor: Palette.white,
      child: isLoading
          ? _loadingLayout()
          : restaurantsList.isNotEmpty
              ? Container(
                  color: Palette.white,
                  height: MediaQuery.of(context).size.height * 0.73,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Caratula(
                        restaurantName:
                            restaurantsList[position].restaurantName,
                        qualification:
                            restaurantsList[position].qualification.toString(),
                        imageUrl: restaurantsList[position].imageUrl,
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => RestaurantDetail(
                                restaurant: restaurantsList[position],
                                isFavorite: true,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: restaurantsList.length,
                  ),
                )
              : Container(
                  color: Palette.white,
                  height: MediaQuery.of(context).size.height * 0.73,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                    'Sin favoritos.\nNo hay restaurantes para mostrar.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Palette.black, fontSize: 16)
                    ),
                  ))),
    ));
  }

  Widget _loadingLayout() {
    return Container(
      color: Palette.white,
      height: MediaQuery.of(context).size.height * 0.73,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Palette.skeleton,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Palette.black.withOpacity(0.5),
                      highlightColor: Palette.black.withOpacity(0.2),
                      child: Container(
                        height: 15,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Palette.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: Palette.black.withOpacity(0.5),
                      highlightColor: Palette.black.withOpacity(0.2),
                      child: Container(
                        height: 15,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Palette.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }

  Future<void> _getRestaurants() async {
    setState(() {
      isLoading = true;
    });
    LogMessage.get("RESTAURANT");
    References.users
        .document(user.id)
        .collection("favorites")
        .snapshots()
        .listen((querySnapshot) {
      LogMessage.getSuccess("RESTAURANT");

      if (querySnapshot.documents.isNotEmpty) {
        restaurantsList.clear();
        querySnapshot.documents.forEach((restaurantDoc) {
          restaurantsList.add(Restaurant(
            id: restaurantDoc.data["id"],
            restaurantName: restaurantDoc.data["restaurantName"],
            address: restaurantDoc.data["address"],
            imageUrl: restaurantDoc.data["imageUrl"],
            qualification: restaurantDoc.data["qualification"],
            schedule: restaurantDoc.data["schedule"],
          ));
        });
      }
      setState(() {
        isLoading = false;
      });
    }).onError((e) {
      LogMessage.getError("RESTAURANT", e);
    });
  }
}
