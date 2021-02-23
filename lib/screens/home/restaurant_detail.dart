import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gourmet/components/components.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gourmet/config/config.dart';
import 'package:gourmet/functions/formatear.dart';
import 'package:gourmet/model/models.dart';
import 'package:gourmet/screens/home/rate_rstaurant.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class RestaurantDetail extends StatefulWidget {
  Restaurant restaurant;
  RestaurantDetail({Key key, this.restaurant}) : super(key: key);

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Rate> ratesList = [];
  @override
  void initState() {
    initializeDateFormatting();
    _tabController = TabController(length: 2, vsync: this);
    _getRates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(300),
        child: AppBar(
          backgroundColor: Palette.white,
          leading: CupertinoNavigationBarBackButton(
            color: Palette.gourmet,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          centerTitle: true,
          title: Text(
            widget.restaurant.restaurantName,
            style: GoogleFonts.poppins(textStyle: Styles.kTituloPremium),
          ),
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Palette.skeleton,
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: NetworkImage(widget.restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          bottom: TabBar(
            unselectedLabelColor: Palette.black.withOpacity(0.3),
            labelColor: Palette.gourmet,
            tabs: [
              Tab(
                child: Text(
                  'Información',
                ),
              ),
              Tab(
                child: Text(
                  'Reseñas',
                ),
              ),
            ],
            controller: _tabController,
            indicatorColor: Palette.gourmet,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
      body: TabBarView(
        children: [
          Expanded(
              child: Container(
            color: Palette.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Horario del restaurante",
                      style:
                          GoogleFonts.poppins(textStyle: Styles.kPremiumStyle)),
                  Text(widget.restaurant.schedule,
                      style: GoogleFonts.poppins(
                          textStyle: Styles.kPremiumStyle2)),
                  const SizedBox(height: 15),
                  Text("Dirección del restaurante",
                      style:
                          GoogleFonts.poppins(textStyle: Styles.kPremiumStyle)),
                  Text(widget.restaurant.address,
                      style: GoogleFonts.poppins(
                          textStyle: Styles.kPremiumStyle2)),
                  const SizedBox(height: 15),
                  Text("Calificación promedio",
                      style:
                          GoogleFonts.poppins(textStyle: Styles.kPremiumStyle)),
                  Text(getCalificacion() == 0 ?"N/A":getCalificacion().toString() ,
                      style: GoogleFonts.poppins(
                          textStyle: Styles.kPremiumStyle2)),
                ],
              ),
            ),
          )),
          Expanded(
            child: ratesList.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Palette.white,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemBuilder: (context, position) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Palette.skeleton.withOpacity(0.4)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Text(
                                                ratesList[position].name,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Palette.black,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  Format.dateFormattedFromDateTime(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              ratesList[
                                                                      position]
                                                                  .created)),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.poppins(
                                                      textStyle: TextStyle(
                                                    color: Palette.black
                                                        .withOpacity(0.4),
                                                  )),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16),
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.star,
                                                color: Palette.yellowDark,
                                                size: 20,
                                              ),
                                              Text(
                                                  ratesList[position].rate == 0
                                                      ? "N/A"
                                                      : ratesList[position]
                                                          .rate
                                                          .toString(),
                                                  style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Palette.yellowDark,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          ratesList[position].commentary ?? "N/A",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                            color: Palette.black,
                                          )),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: ratesList.length,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GourmetButton(
                          onPressed: () async{
                            final result = await Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RateRestaurant(
                                  restaurant: widget.restaurant,
                                ),
                              ),
                            );
                            getCalificacion();
                          },
                          title: "Calificar",
                          canPush: true,
                        ),
                      )
                    ],
                  )
                : Column(
                    children: [
                      Expanded(child: Container()),
                      Container(
                          color: Palette.white,
                          child: Center(
                              child: Text(
                            'Sin resultados.\nNo hay reseñas para mostrar.',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Palette.black, fontSize: 16),
                          ))),
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GourmetButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RateRestaurant(
                                  restaurant: widget.restaurant,
                                ),
                              ),
                            );
                          },
                          title: "Calificar",
                          canPush: true,
                        ),
                      )
                    ],
                  ),
          )
        ],
        controller: _tabController,
      ),
    );
  }

  int getCalificacion() {
    int rateTemp = 0;
    setState(() {
      ratesList.forEach((element) {
        rateTemp += element.rate;
        print(rateTemp);
      });
      if(rateTemp != 0) {
        rateTemp = (rateTemp ~/ ratesList.length).toInt();
      }
    });
    return rateTemp;
  }

  void _getRates() {
    LogMessage.get("RATES");
    References.restaurants
        .document(widget.restaurant.id)
        .collection("rates")
        .orderBy("created", descending: true)
        .snapshots()
        .listen((querySnapshot) {
      LogMessage.getSuccess("RATES");
      setState(() {
        if (querySnapshot.documents.isNotEmpty) {
          ratesList.clear();
          querySnapshot.documents.forEach((rateDoc) {
            ratesList.add(Rate(
              id: rateDoc.documentID,
              name: rateDoc.data["name"],
              rate: rateDoc.data["rate"],
              created: rateDoc.data["created"],
              commentary: rateDoc.data["commentary"],
            ));
          });
        }
        getCalificacion();
      });
    }).onError((e) {
      LogMessage.getError("RATES", e);
    });
  }
}
