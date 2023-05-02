import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project2/models/connection.dart';
import 'package:project2/widgets/grid.dart';

class marketplace extends StatefulWidget {
  const marketplace({Key? key}) : super(key: key);

  @override
  State<marketplace> createState() => _marketplaceState();
}

class _marketplaceState extends State<marketplace>
    with TickerProviderStateMixin {
  bool isScrolled = true;
  var bookdata;
  var selldata;
  var userSellings;

  @override
  void initState() {
    bookdata = MongoDatabase.fetchbooks();
    selldata = MongoDatabase.fetchBuybooks();
    userSellings = MongoDatabase.fetchUserSellings();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, "/sellSearch");
        },
        isExtended: isScrolled,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        label: const Text('Sell Books'),
        icon: const Icon(Icons.add),
      ),

      body: RefreshIndicator(
        onRefresh: () async {
          var x = MongoDatabase.fetchBuybooks();
          var y = MongoDatabase.fetchUserSellings();
          setState(() {
            selldata = x;
            userSellings = y;
          });
        },
        child: NotificationListener<UserScrollNotification>(
          // onNotification: (notification){
          //   if(notification.direction==ScrollDirection.forward){
          //     setState(() {
          //       isScrolled=true;
          //
          //     });
          //     print('hello');
          //   }
          //   else if(notification.direction==ScrollDirection.reverse){
          //     setState(() {
          //       isScrolled=false;
          //
          //     });
          //     print(isScrolled);
          //   }
          //   return true;
          // },
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Marketplace",
                      style: GoogleFonts.montserrat(
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    )),

                //TABS ()

                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        controller: _tabController,
                        labelColor: Theme.of(context).primaryColor,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor, width: 3.5),
                        ),
                        unselectedLabelColor: Color(0xff969696),
                        tabs: [
                          Tab(
                            text: "Buy",
                          ),
                          Tab(
                            text: "Your Sell Listings",
                          ),
                        ]),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //TAB BAR VIEW (TAB AREAS)
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  // color: Colors.black,
                  child: TabBarView(controller: _tabController, children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: futurebuygrid(selldata)),
                    Container(
                        padding: EdgeInsets.all(10),
                        child: userSellGrid(userSellings))
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
