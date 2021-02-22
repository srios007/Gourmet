import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/model/models.dart';
import 'package:gourmet/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  String searchText = "";
  List<Restaurant> restaurantsList = [];
  @override
  void initState() {
    _getRestaurants();
    super.initState();
  }

  @override
// TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          bottomOpacity: 0,
          backgroundColor: Palette.white,
          centerTitle: true,
          title: Text('GOURMET',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Palette.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2),
              )),
          flexibleSpace: Column(
            children: <Widget>[
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GourmetTextField(
                  initialValue: searchText,
                  icon: Icons.search,
                  iconColor: Palette.gourmet,
                  placeholder: "Buscar",
                  onChanged: (text) {
                    searchText = text;
                    //_filterBySearch(text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Scaffold(
        body: Container(
          color: Palette.white,
          height: MediaQuery.of(context).size.height * 0.73,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Caratula(
                  restaurantName: restaurantsList[position].restaurantName,
                  qualification:
                      restaurantsList[position].qualification.toString(),
                  imageUrl: restaurantsList[position].imageUrl);
            },
            itemCount: restaurantsList.length,
          ),
        ),
      ),
    );
  }

  void _getRestaurants() {
    LogMessage.get("RESTAURANT");
    References.restaurants.snapshots().listen((querySnapshot) {
      LogMessage.getSuccess("RESTAURANT");
      restaurantsList.clear();
      if (querySnapshot.documents.isNotEmpty) {
        querySnapshot.documents.forEach((restaurantDoc) {
          restaurantsList.add(Restaurant(
            restaurantName: restaurantDoc.data["restaurantName"],
            address: restaurantDoc.data["address"],
            imageUrl: restaurantDoc.data["imageUrl"],
            qualification: restaurantDoc.data["qualification"],
            schedule: restaurantDoc.data["schedule"],
          ));
        });
      }
    }).onError((e) {
      LogMessage.getError("RESTAURANT", e);
    });
  }
}
