
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       // Text("SUSHI RAIL",style: TextStyle(fontSize: size.width*0.08,fontWeight: FontWeight.bold),),
                       Image.asset("images/topImg.jpeg",scale: 3,),
                     ],
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsets.symmetric(vertical: size.height*0.02,horizontal: size.width*0.05),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           border: Border.all(color: Colors.blueAccent,width: 2),
                           borderRadius: BorderRadius.all(Radius.circular(10)),
                         ),
                         child: Row(
                           children: [
                             Padding(
                               padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                               child: Icon(Icons.search,color: Colors.black12,size: 40,),
                             ),
                             Expanded(
                               child: TextField(

                                 decoration: InputDecoration(
                                     border: InputBorder.none,
                                     focusedBorder: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                     errorBorder: InputBorder.none,
                                     disabledBorder: InputBorder.none,
                                   hintText: "Search your train connection",
                                   hintStyle: TextStyle(
                                     color: Colors.black12,

                                   )
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding:  EdgeInsets.symmetric(vertical: size.height*0.015),
                         child: Text("Your search results:",style: TextStyle(fontSize: size.width*0.04,decoration: TextDecoration.underline),),
                       ),
    StreamBuilder<QuerySnapshot>(
    stream:
    _firestore.collection("data").snapshots(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    final data = snapshot.data;
    List<DetailCard> cardWidgets = [];
    for(var info in data!.docs)
    {
    var date = info["date"];
    var time = info["time"];
    var track = info["track"];
    var data = info["data"];
    var Apersons = data[0]["persons"];
    var Avalue = data[0]["values"];
    var Bpersons = data[1]["persons"];
    var Bvalue = data[1]["values"];
    var Cpersons = data[2]["persons"];
    var Cvalue = data[2]["values"];
    var Dpersons = data[3]["persons"];
    var Dvalue = data[3]["values"];
    var Epersons = data[4]["persons"];
    var Evalue = data[4]["values"];
    var Fpersons = data[5]["persons"];
    var Fvalue = data[5]["values"];
    var destination = info["destination"];
    final cardWidget = DetailCard(size: size,Apersons: Apersons,Avalue: Avalue,Bpersons: Bpersons,Bvalue: Bvalue,Cpersons: Cpersons,Cvalue: Cvalue,Dpersons: Dpersons,Dvalue:Dvalue,Epersons: Epersons,Evalue:Evalue,Fpersons: Fpersons,Fvalue: Fvalue,date:date,time:time,track:track,destination: destination,);
    cardWidgets.add(cardWidget);
    }
    return ListView(
    shrinkWrap: true,
    children: cardWidgets,
    );
    }
    else
    {
      return Container();
    }
    }
    )
                     ],
                   ),
                 )
               ],
            ),
            Container(
              height: size.height*0.15,
              decoration: BoxDecoration(
                border: Border.symmetric(horizontal: BorderSide(color: Colors.blue,width: 3)),
                color: Colors.lightBlueAccent
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.01),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          // Icon(Icons.volume_up,color: Colors.white,),
                          //   Container(
                          //     width: size.width*0.35,
                          //     decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.blueGrey ,width: 2),
                          //       borderRadius: BorderRadius.all(Radius.circular(4)),
                          //       color: Colors.grey,
                          //     ),
                          //     child: Center(child: Text("Very loud",style: TextStyle(color: Colors.white))),
                          //   ),
                            Icon(Icons.info,size: 50,color: Colors.white,),
                            Text("Legend",style: TextStyle(fontSize: size.width*0.08,color: Colors.white)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width*0.35,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey ,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    color: Colors.lime,
                                  ),
                                  child: Center(child: Text("0-25 Persons",style: TextStyle(color: Colors.white))),
                                ),
                                Container(
                                  width: size.width*0.35,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blueGrey ,width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    color: Color(0xffF8BD31),
                                  ),
                                  child: Center(child: Text("25-50 Persons",style: TextStyle(color: Colors.white))),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       // Icon(Icons.whatshot,color: Colors.white,),
                    //       // Container(
                    //       //   width: size.width*0.35,
                    //       //   decoration: BoxDecoration(
                    //       //     border: Border.all(color: Colors.blueGrey ,width: 2),
                    //       //     borderRadius: BorderRadius.all(Radius.circular(4)),
                    //       //     color: Colors.grey,
                    //       //   ),
                    //       //   child: Center(child: Text("Very hot",style: TextStyle(color: Colors.white))),
                    //       // ),
                    //       // Container(
                    //       //   width: size.width*0.35,
                    //       //   decoration: BoxDecoration(
                    //       //     border: Border.all(color: Colors.blueGrey ,width: 2),
                    //       //     borderRadius: BorderRadius.all(Radius.circular(4)),
                    //       //     color: Color(0xffF8BD31),
                    //       //   ),
                    //       //   child: Center(child: Text("25-50 Persons",style: TextStyle(color: Colors.white))),
                    //       // )
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Icon(Icons.ac_unit,color: Colors.white,),
                          // Container(
                          //   width: size.width*0.35,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.blueGrey ,width: 2),
                          //     borderRadius: BorderRadius.all(Radius.circular(4)),
                          //     color: Colors.grey,
                          //   ),
                          //   child: Center(child: Text("Very cold",style: TextStyle(color: Colors.white))),
                          // ),
                          Icon(Icons.volume_up,color: Colors.white,),
                          Container(
                            width: size.width*0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey ,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              color: Colors.grey,
                            ),
                            child: Center(child: Text("Very loud",style: TextStyle(color: Colors.white))),
                          ),
                          Container(
                            width: size.width*0.35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey ,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              color: Colors.red,
                            ),
                            child: Center(child: Text("50-100 Persons",style: TextStyle(color: Colors.white))),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailCard extends StatefulWidget {
  const DetailCard({
    Key? key,
    required this.size,this.Apersons,this.Avalue,this.Bpersons,this.Bvalue,this.Cpersons,this.Cvalue,this.Dpersons,this.Dvalue,this.Epersons,this.Evalue,this.Fpersons,this.Fvalue,this.date,this.time,this.track,this.destination
  }) : super(key: key);

  final Size size;
  final Apersons;

  final Avalue;

  final Bpersons;

  final Bvalue;

  final Cpersons;

  final Cvalue;

  final Dpersons;

  final Dvalue;

  final Epersons;

  final Evalue;

  final Fpersons;
  final destination;
  final Fvalue;
  final date;
  final time;
  final track;

  @override
  _DetailCardState createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: widget.size.height*0.015),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today, Do. "+widget.date+" - "+widget.time+"",style: TextStyle(fontSize: widget.size.width*0.04),),
                  Text(widget.destination,style: TextStyle(fontSize: widget.size.width*0.04),),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent,width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.black12,
                  ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Column(
                        children: [
                          Text("Track"),
                          Text(widget.track),
                        ],
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.black12,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("Current status of the train",style: TextStyle(color: Colors.grey),),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: widget.size.height*0.01,horizontal: widget.size.width*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: widget.Apersons <25? Colors.lime : (widget.Apersons >25 && widget.Apersons <50 ?  Color(0xffF8BD31) : Colors.red),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widget.size.width*0.03,vertical: widget.size.height*0.009),
                              child: Text("A",style: TextStyle(fontSize: widget.size.width*0.05,color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: widget.Avalue >= 75 ?  Icon(Icons.volume_up,color: Colors.grey,) : Icon(Icons.ac_unit,color: Colors.transparent,)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: widget.Bpersons <25? Colors.lime : (widget.Bpersons >25 && widget.Bpersons <50 ?  Color(0xffF8BD31) : Colors.red),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widget.size.width*0.03,vertical: widget.size.height*0.009),
                              child: Text("B",style: TextStyle(fontSize: widget.size.width*0.05,color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: widget.Bvalue >= 75 ?  Icon(Icons.volume_up,color: Colors.grey,) : Icon(Icons.ac_unit,color: Colors.transparent,)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: widget.Cpersons <25? Colors.lime : (widget.Cpersons >25 && widget.Cpersons <50 ?  Color(0xffF8BD31) : Colors.red),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widget.size.width*0.03,vertical: widget.size.height*0.009),
                              child: Text("C",style: TextStyle(fontSize: widget.size.width*0.05,color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: widget.Cvalue >= 75 ?  Icon(Icons.volume_up,color: Colors.grey,) : Icon(Icons.ac_unit,color: Colors.transparent,)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: widget.Dpersons <25? Colors.lime : (widget.Dpersons >25 && widget.Dpersons <50 ?  Color(0xffF8BD31) : Colors.red),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widget.size.width*0.03,vertical: widget.size.height*0.009),
                              child: Text("D",style: TextStyle(fontSize: widget.size.width*0.05,color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: widget.Dvalue >= 75 ?  Icon(Icons.volume_up,color: Colors.grey,) : Icon(Icons.ac_unit,color: Colors.transparent,),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: widget.Epersons <25? Colors.lime : (widget.Epersons >25 && widget.Epersons <50 ?  Color(0xffF8BD31) : Colors.red),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widget.size.width*0.03,vertical: widget.size.height*0.009),
                              child: Text("E",style: TextStyle(fontSize: widget.size.width*0.05,color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: widget.Evalue >= 75 ?  Icon(Icons.volume_up,color: Colors.grey,) : Icon(Icons.ac_unit,color: Colors.transparent,),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueAccent,width: 2),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: widget.Fpersons <25? Colors.lime : (widget.Fpersons >25 && widget.Fpersons <50 ?  Color(0xffF8BD31) : Colors.red),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: widget.size.width*0.03,vertical: widget.size.height*0.009),
                              child: Text("F",style: TextStyle(fontSize: widget.size.width*0.05,color: Colors.white),),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(top: 10.0),
                            child: widget.Fvalue >= 75 ?  Icon(Icons.volume_up,color: Colors.grey,) : Icon(Icons.ac_unit,color: Colors.transparent,),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
