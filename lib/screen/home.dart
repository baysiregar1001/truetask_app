import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
// import 'package:truetask_app/screen/notif.dart';

class Home extends StatefulWidget {
  const Home({super.key, required String title});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List imgs = [
    "https://translate.google.com/website?sl=en&tl=id&hl=id&prev=search&u=https://images.unsplash.com/photo-1661961111184-11317b40adb2?ixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8%26auto%3Dformat%26fit%3Dcrop%26w%3D872%26q%3D80",
    "https://translate.google.com/website?sl=en&tl=id&hl=id&prev=search&u=https://images.unsplash.com/photo-1667429388274-590f0e6afb84?ixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXx3R2NNV2xJdThyWXx8ZW58MHx8fHw%253D%26auto%3Dformat%26fit%3Dcrop%26w%3D900%26q%3D60",
    "https://translate.google.com/website?sl=en&tl=id&hl=id&prev=search&u=https://images.unsplash.com/photo-1667429678289-806b4ac50292?ixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnx3R2NNV2xJdThyWXx8ZW58MHx8fHw%253D%26auto%3Dformat%26fit%3Dcrop%26w%3D900%26q%3D60",
    "https://translate.google.com/website?sl=en&tl=id&hl=id&prev=search&u=https://images.unsplash.com/photo-1661956602153-23384936a1d3?ixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8NXx3R2NNV2xJdThyWXx8ZW58MHx8fHw%253D%26auto%3Dformat%26fit%3Dcrop%26w%3D900%26q%3D60",
    "https://translate.google.com/website?sl=en&tl=id&hl=id&prev=search&u=https://images.unsplash.com/photo-1496171367470-9ed9a91ea931?ixlib%3Drb-4.0.3%26ixid%3DMnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxMjY0MDk3fHxlbnwwfHx8fA%253D%253D%26auto%3Dformat%26fit%3Dcrop%26w%3D900%26q%3D60",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(labelColor: Colors.blueAccent, tabs: [
            Tab(
              text: 'overview',
            ),
            Tab(
              text: 'Calender',
            )
          ]),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Dashboard",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            PopupMenuButton(
              icon: const Image(image: AssetImage('assets/image/add_icon.png')),
              itemBuilder: (_) => [
                PopupMenuItem<String>(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                )),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    height: 700,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: <Widget>[
                                          const Text(
                                            'Create project',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Column(
                                                      children: const [
                                                        Text(
                                                          'Name',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextField(
                                                          obscureText: true,
                                                          decoration:
                                                              InputDecoration(
                                                            border:
                                                                OutlineInputBorder(),
                                                            labelText:
                                                                'Project name',
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          ElevatedButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('keluar'))
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: const Text(
                            'create Project',
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      height: 700,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            const Text(
                                                'tutup modalbottomsheet'),
                                            ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('keluar'))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: const Text('Create Task')),
                        TextButton(
                            onPressed: () {
                              showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      height: 700,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text('keluar'))
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: const Text('create team'))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'search',
                    hintStyle: const TextStyle(color: Colors.black87),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/image/ourproject.png'),
                    const Text(
                      'Our Project',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Container(
                      height: 180,
                      width: 320,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Image.network(
                              imgs[index],
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        itemCount: imgs.length,
                        pagination: const SwiperPagination(),
                        control: const SwiperControl(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/image/Task.png'),
                    const Text(
                      'Our Task',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(
                      width: 180,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Column(
                        children: [
                          Card(
                            child: Container(
                              width: 400,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 237, 230, 230),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Card(
                            child: Container(
                              width: 400,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 237, 230, 230),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Card(
                            child: Container(
                              width: 400,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 237, 230, 230),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Card(
                            child: Container(
                              width: 400,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 237, 230, 230),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Card(
                            child: Container(
                              width: 400,
                              height: 85,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(11),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 237, 230, 230),
                                      blurRadius: 2.0,
                                      spreadRadius: 0.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]),
                            ),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
          )
        ]),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: const Text("Kelompok 1"),
                accountEmail: const Text("Kelompok1@gmail.com"),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
                ),
                decoration: BoxDecoration(
                  color: Colors.blueGrey[900],
                ),
                otherAccountsPictures: const [
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(
                  //       "https://randomuser.me/api/portraits/women/74.jpg"),
                  // ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: NetworkImage(
                  //       "https://randomuser.me/api/portraits/men/47.jpg"),
                  // ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.code),
                title: const Text("About"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notification"),
                onTap: (() {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return const Notif();
                  // }));
                }),
              ),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                ),
                title: const Text("Logout"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
