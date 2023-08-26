import 'package:flutter/material.dart';
import 'package:hotel_database/components/Searchbottom_sheet.dart';
import 'package:hotel_database/constant/colors.dart';
import 'package:hotel_database/constant/extensions.dart';
import 'package:hotel_database/constant/spaces.dart';
import 'package:hotel_database/screens/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final supabase = Supabase.instance.client;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          iconSize: 15,
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await supabase.auth.signOut();
            if (context.mounted) {
              context.pop;
            }
          },
        ),
      ),
      body: Column(
        children: [
          getBody(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Favorite Place To Holiday",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text('See All >'),
            ],
          ),
          const HotelsList(),
        ],
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 480,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: spacer),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: size.width,
                  height: 300.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF4964FE), Color(0xFF27B7FE)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: appPadding, right: appPadding),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: spacer),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hello Rachel',
                            style: TextStyle(
                              color: textWhite,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: appPadding),
                            width: 200,
                            height: 100,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage('assets/1.png'),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: spacer),
                      CustomSearchField(
                        hintField: 'Where do you want to Stay ? ...',
                        backgroundColor: background,
                      ),
                      const SizedBox(height: spacer - 30.0),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Popular cities'),
                    GestureDetector(
                      onTap: () => {},
                      child: Row(
                        children: const [
                          Text('See All >'),
                        ],
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 10),
            const ListCategoriesHome(),
          ],
        ),
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  final String hintField;
  final Color backgroundColor;

  CustomSearchField({
    required this.hintField,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const Icon(Icons.search),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: hintField,
                border: InputBorder.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Search"),
            style: ElevatedButton.styleFrom(
              primary: primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListCategoriesHome extends StatelessWidget {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"name": "London", "image": "2.png"},
      {"name": "Paris", "image": "3.png"},
      {"name": "Rome", "image": "4.png"},
      {"name": "Jakarta", "image": "5.png"},
      {"name": "Bangkok", "image": "6.png"},
    ];

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, i) => GestureDetector(
                onTap: () => {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SearchBottomSheet();
                    },
                    isScrollControlled: true,
                  )
                },
                child: Container(
                  height: 600,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 8.0),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xff0C6CF2).withOpacity(.1),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/${categories[i]["image"]}'),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          categories[i]["name"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
