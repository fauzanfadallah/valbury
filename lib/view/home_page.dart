import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Hospital> _listRumahSakit = [
    Hospital(
        nama: 'Rumah Sakit Harapan',
        alamat: 'Bandung',
        categories: ['BPSJ', 'Terdekat']),
    Hospital(
        nama: 'Rumah Sakit Sejahtera',
        alamat: 'Jakarta',
        categories: ['BPSJ', 'Partner']),
    Hospital(
        nama: 'Rumah Sakit Waras',
        alamat: 'Surabaya',
        categories: ['Terdekat', 'Partner']),
  ];
  final List<Hospital> _listKlinik = [
    Hospital(
        nama: 'Klinik Harapan',
        alamat: 'Bandung',
        categories: ['BPSJ', 'Terdekat']),
    Hospital(
        nama: 'Klinik Sejahtera',
        alamat: 'Jakarta',
        categories: ['BPSJ', 'Partner']),
    Hospital(
        nama: 'Klinik Waras',
        alamat: 'Surabaya',
        categories: ['Terdekat', 'Partner']),
  ];
  final List<String> _listCategories = ['Semua', 'BPSJ', 'Terdekat', 'Partner'];

  final List<Hospital> _showedRumahSakit = [];
  final List<Hospital> _showedKlinik = [];

  final List<String> _selectedCategoryRumahSakit = ['Semua'];
  final List<String> _selectedCategoryKlinik = ['Semua'];

  final List<String> _listBanner = [
    'Banner 1',
    'Banner 2',
    'Banner 3',
    'Banner 4',
    'Banner 5',
    'Banner 6'
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _showedRumahSakit.addAll(_listRumahSakit);
    _showedKlinik.addAll(_listKlinik);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext conetxt) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  title: const Text('Valbury'),
                  centerTitle: false,
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  leading: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.menu)),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications)),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50.0),
                    child: SizedBox(
                        height: 50,
                        child: Row(
                          children: const [
                            Expanded(child: Center(child: Text('Rumah Sakit'))),
                            Expanded(child: Center(child: Text('Klinik'))),
                          ],
                        )),
                  )),
            ];
          },
          body: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Rumah Sakit',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.deepOrange),
                        ),
                      )
                    ],
                  )),
              _categoryToggle(_selectedCategoryRumahSakit, _showedRumahSakit,
                  _listRumahSakit),
              _listData(_showedRumahSakit),
              SizedBox(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: _listBanner.length,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(_listBanner[index]),
                        ),
                      );
                    },
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Klinik',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          'Lihat Semua',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.deepOrange),
                        ),
                      )
                    ],
                  )),
              _categoryToggle(
                  _selectedCategoryKlinik, _showedKlinik, _listKlinik),
              _listData(_showedKlinik),
              const SizedBox(
                height: 40,
              )
            ],
          ))),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Rumah Sakit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Klinik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        elevation: 3.0,
      ),
    );
  }

  Widget _listData(List<Hospital> data) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: Image.asset('assets/images/hospital.jpg',
                      fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        data[index].nama!,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        data[index].alamat!,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      )
                    ])),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Lihat Detail',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.deepOrange),
                  ),
                )
              ],
            ),
          );
        });
  }

  void _setShowedData(List<Hospital> showedData, List<Hospital> allData,
      List<String> categories) {
    setState(() {
      showedData.clear();
      if (categories.length == 1) {
        showedData.addAll(allData);
      } else {
        List<String> filter = [];
        filter.addAll(categories);
        filter.removeAt(0);
        for (String c in categories) {
          for (Hospital h in allData) {
            if (h.categories!.contains(c)) {
              if (!showedData.contains(h)) showedData.add(h);
            }
          }
        }
      }
    });
  }

  Widget _categoryToggle(List<String> selected, List<Hospital> showedData,
      List<Hospital> allData) {
    return SizedBox(
        height: 40,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            itemCount: _listCategories.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      if (index == 0) {
                        selected.removeRange(1, selected.length);
                      } else {
                        if (selected.contains(_listCategories[index])) {
                          selected.remove(_listCategories[index]);
                        } else {
                          selected.add(_listCategories[index]);
                        }
                      }
                    });
                    _setShowedData(showedData, allData, selected);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: selected.contains(_listCategories[index])
                            ? Colors.orange
                            : Colors.white,
                        border: Border.all(color: Colors.grey.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(_listCategories[index]),
                  ));
            }));
  }
}

class Hospital {
  String? nama;
  String? alamat;
  List<String>? categories;

  Hospital({this.nama, this.alamat, this.categories});
}
