import 'package:expense_zx/app/widgets/colorPick.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../controllers/home_controller.dart';
import '../widgets/buttonFrequency_items.dart';
import '../widgets/income_items.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(DateTime(2011), 10),
      SalesData(DateTime(2012), 30),
      SalesData(DateTime(2013), 15),
      SalesData(DateTime(2014), 38),
      SalesData(DateTime(2015), 25),
      SalesData(DateTime(2016), 60),
      SalesData(DateTime(2017), 25),
    ];
    return Scaffold(
      body: Stack(
        children: [
          // * Layer 1 : background
          Container(
            decoration: BoxDecoration(
              gradient: violetlinear,
            ),
          ),
          Container(
            height: 320,
            decoration: BoxDecoration(
              gradient: kuningLinear,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          // * Layer 2 : Content
          SafeArea(
            child: Column(
              children: [
                // * Profile Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/avatar.png"),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/images/arrowDown_ic.png"),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "October",
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: appBlack70,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.notifications_rounded,
                        color: appViolet,
                      ),
                    ],
                  ),
                ),

                // * Account Balance
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Account Balance",
                  style: GoogleFonts.inter(
                    color: appGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // * $9400
                SizedBox(
                  height: 12,
                ),
                Text(
                  "\$9400",
                  style: GoogleFonts.inter(
                    color: appBlack,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // * Container income
                SizedBox(
                  height: 27,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IncomeItems(
                      path: "assets/images/kameraHijau_ic.png",
                      title: "Income",
                      subtitle: "\$5000",
                      warna: appGreen,
                    ),
                    IncomeItems(
                      path: "assets/images/kameraMerah_ic.png",
                      title: "Expense",
                      subtitle: "\$1200",
                      warna: appRed,
                    ),
                  ],
                ),

                // * Spend Frequency
                SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Spend Frequency",
                      style: GoogleFonts.inter(
                        color: appBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                // * Spend Frequency items
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      // * Charts
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: 200,
                          width: chartData.length * 100,
                          child: SfCartesianChart(
                            primaryXAxis: DateTimeAxis(),
                            series: <CartesianSeries>[
                              // Renders line chart
                              SplineSeries<SalesData, DateTime>(
                                  width: 6,
                                  color: appViolet,
                                  dataSource: chartData,
                                  xValueMapper: (SalesData sales, _) =>
                                      sales.year,
                                  yValueMapper: (SalesData sales, _) =>
                                      sales.sales)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      // * BUTTONS
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonFrequency(label: "Today"),
                          ButtonFrequency(label: "Week", istrue: false),
                          ButtonFrequency(label: "Month", istrue: false),
                          ButtonFrequency(label: "Year", istrue: false),
                        ],
                      ),

                      // * Recent Transaction & button See All
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transaction",
                              style: GoogleFonts.inter(
                                  fontSize: 18,
                                  color: appBlack,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: appVioletSoft,
                              ),
                              child: Text(
                                "See All",
                                style: GoogleFonts.inter(
                                    fontSize: 14,
                                    color: appViolet,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // *ITEMS TRANSACTION
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 20,
                                ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              // List of configurations for each item
                              List<Map<String, dynamic>> itemConfigs = [
                                {
                                  'color':
                                      appYellowSoft, // Warna untuk background atau elemen lainnya
                                  'imagePath':
                                      "assets/images/shopping-bag.png", // Path untuk gambar
                                  'title': "Shopping", // Judul
                                  'price': "-\$120", // Harga
                                  'description':
                                      "Buy some grocery", // Deskripsi
                                  'time': "10:00 AM", // Waktu
                                },
                                {
                                  'color':
                                      appVioletSoft, // Warna untuk background atau elemen lainnya
                                  'imagePath':
                                      "assets/images/bill.png", // Path untuk gambar
                                  'title': "Subscription", // Judul
                                  'price': "-\$80", // Harga
                                  'description':
                                      "Disney+ Annual..", // Deskripsi
                                  'time': "03:30 PM", // Waktu
                                },
                                {
                                  'color':
                                      appRedSoft, // Warna untuk background atau elemen lainnya
                                  'imagePath':
                                      "assets/images/restaurant.png", // Path untuk gambar
                                  'title': "Food", // Judul
                                  'price': "-\$30", // Harga
                                  'description': "Buy a ramen", // Deskripsi
                                  'time': "11:00 AM", // Waktu
                                },
                                {
                                  'color':
                                      appYellowSoft, // Warna untuk background atau elemen lainnya
                                  'imagePath':
                                      "assets/images/shopping-bag.png", // Path untuk gambar
                                  'title': "Shopping", // Judul
                                  'price': "-\$120", // Harga
                                  'description':
                                      "Buy some grocery", // Deskripsi
                                  'time': "10:00 AM", // Waktu
                                },
                                // Tambahkan konfigurasi untuk item lainnya di sini
                              ];

                              // Ambil konfigurasi berdasarkan indeks
                              var config = itemConfigs[index];

                              return ListTile(
                                title: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: config['color'],
                                      ),
                                      child: Image.asset(config['imagePath']),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                config['title'],
                                                style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    color: appBlack,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                config['price'],
                                                style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    color: appRed,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                config['description'],
                                                style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    color: appGrey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                config['time'],
                                                style: GoogleFonts.inter(
                                                    fontSize: 13,
                                                    color: appGrey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        activeColor: appViolet,
        backgroundColor: appVioletSoft.withOpacity(0.9),
        style: TabStyle.fixedCircle,
        initialActiveIndex: 2,
        elevation: 0,
        color: appGrey,
        items: [
          TabItem(
            icon: Icons.home_filled,
            title: 'Home',
          ),
          TabItem(icon: Icons.compare_arrows, title: 'Transaction'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.pie_chart, title: 'Budget'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        onTap: (int i) => print('click index=$i'),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
