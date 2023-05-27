import 'package:coffe_shop_app/widgets/home_bottom_bar.dart';
import 'package:coffe_shop_app/widgets/item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.sort_rounded,
                        color: Colors.white.withOpacity(0.5),
                        size: 35,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white.withOpacity(0.5),
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It's a Great Day for Coffee",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 50, 54, 56),
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find your coffee",
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.5))),
                ),
              ),
              TabBar(
                labelColor: const Color(0xFFE57734),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                indicator: const UnderlineTabIndicator(
                    borderSide: BorderSide(width: 3, color: Color(0xFFE57734)),
                    insets: EdgeInsets.symmetric(horizontal: 16)),
                isScrollable: true,
                controller: _tabController,
                tabs: const [
                  Tab(
                    text: "Hot Coffee",
                  ),
                  Tab(
                    text: "Cold Coffee",
                  ),
                  Tab(
                    text: "Cappuccino",
                  ),
                  Tab(
                    text: "Americano",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: [
                  ItemWidget(),
                  ItemWidget(),
                  ItemWidget(),
                  ItemWidget(),
                ][_tabController.index],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
