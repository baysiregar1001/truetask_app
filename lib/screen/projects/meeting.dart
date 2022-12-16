import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart';

class Meeting extends StatelessWidget {
  const Meeting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Meeting",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => (const ProjectDetailsPage()),
        //       ),
        //     );
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.grey[700],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.computer,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Daily Design Meeting",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.date_range,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "07/12/2022",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: const [
                            Icon(
                              Icons.access_time,
                              color: Colors.grey,
                              size: 18,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "09.00 AM - 10.00 AM",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.black;
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          return Colors.white;
                        },
                      ),
                      shape: MaterialStateProperty.resolveWith(
                        (states) {
                          return RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          );
                        },
                      ),
                      padding: MaterialStateProperty.resolveWith(
                        (states) {
                          return const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10);
                        },
                      ),
                    ),
                    child: const Text("JOIN"),
                  ),
                ],
              ),
            ),
          );
        },
        // children: [
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        //   const Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //   ),
        //   Container(
        //     decoration: BoxDecoration(
        //       color: Colors.black.withOpacity(0.75),
        //       borderRadius: BorderRadius.circular(16),
        //     ),
        //     padding: const EdgeInsets.all(16),
        //     child: Row(
        //       children: [
        //         Container(
        //           height: 60,
        //           width: 60,
        //           decoration: BoxDecoration(
        //               color: Colors.grey[700],
        //               borderRadius: BorderRadius.circular(8)),
        //           child: const Icon(
        //             Icons.computer,
        //             color: Colors.white,
        //             size: 35,
        //           ),
        //         ),
        //         const SizedBox(
        //           width: 16,
        //         ),
        //         Expanded(
        //           child: Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               const Text(
        //                 "Daily Design Meeting",
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.white,
        //                   fontSize: 13,
        //                 ),
        //               ),
        //               const Padding(
        //                 padding: EdgeInsets.only(bottom: 10),
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.date_range,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "07/12/2022",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               const SizedBox(
        //                 height: 4,
        //               ),
        //               Row(
        //                 children: const [
        //                   Icon(
        //                     Icons.access_time,
        //                     color: Colors.grey,
        //                     size: 18,
        //                   ),
        //                   SizedBox(
        //                     width: 4,
        //                   ),
        //                   Text(
        //                     "09.00 AM - 10.00 AM",
        //                     style: TextStyle(
        //                       color: Colors.grey,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 12,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //         TextButton(
        //           onPressed: () {},
        //           style: ButtonStyle(
        //             backgroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.black;
        //               },
        //             ),
        //             foregroundColor: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return Colors.white;
        //               },
        //             ),
        //             shape: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return RoundedRectangleBorder(
        //                   borderRadius: BorderRadius.circular(30),
        //                 );
        //               },
        //             ),
        //             padding: MaterialStateProperty.resolveWith(
        //               (states) {
        //                 return const EdgeInsets.symmetric(
        //                     horizontal: 20, vertical: 10);
        //               },
        //             ),
        //           ),
        //           child: const Text("JOIN"),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            createMeetingPage,
          );
        },
        label: const Text("Create Meeting"),
        icon: const Icon(
          Icons.add_box,
        ),
      ),
    );
  }
}
