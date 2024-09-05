import 'package:flutter/material.dart';

Widget userCard() {
  return Card(
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Harsh Pawar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.check,
                          size: 12,
                          color: Colors.red,
                        ),
                        Text(
                          'Not Verified',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 10,
                              decorationStyle: TextDecorationStyle.dotted),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(
                    Icons.fingerprint,
                    color: Colors.red,
                    size: 20,
                  ),
                  Text(
                    'App ID : --- ---',
                  ),
                ],
              )
            ],
          )),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.green),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
              ),
              onPressed: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  ),
                  Text(
                    'Verify Now',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ))
        ],
      ),
    ),
  );
}

Widget ExploreHiremiCard() {
  return Card(
    color: const Color.fromARGB(255, 255, 240, 182),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 180,
            child: Text(
              'Are you a College Student?',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              softWrap: true,
            ),
          ),
          const Text(
            'Get your Mentor Today',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 89, 162)),
          ),
          ElevatedButton(
            onPressed: () {},
            style: const ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size.zero),
              padding:
                  WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10)),
              backgroundColor: WidgetStatePropertyAll(Colors.red),
            ),
            child: const Text('Verify Now',
                style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          const Text(
            'T&C Apply',
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    ),
  );
}

Card featuredCard(int index, List<dynamic> featuredList) {
  return Card(
    color: featuredList[index]['color'],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            featuredList[index]['icon'],
            color: Colors.white,
            size: 20,
          ),
          Text(
            featuredList[index]['text'],
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}

Widget LatOppCard() {
  return Card(
    // color: Colors.red,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jr. Java Programmer',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'CRTD Technologies',
                    style: TextStyle(fontSize: 10),
                  )
                ],
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.location_pin,
                size: 14,
              ),
              Text(
                'Bhopal, Madhya Pradesh, India',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.important_devices,
                size: 14,
              ),
              Text(
                'BE/B.TECH/M.TECH/MCA/MBA/BCA/BSC/MSC',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.money,
                size: 14,
              ),
              Text(
                '4.75 LPA',
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 244, 211),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 12,
                          ),
                          Text(
                            'Remote',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 244, 211),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 12,
                          ),
                          Text(
                            'Remote',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    ),Container(
                      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 254, 244, 211),
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            size: 12,
                          ),
                          Text(
                            'Remote',
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){}, 
              
              style: ButtonStyle(
                backgroundColor: const WidgetStatePropertyAll(Colors.red),
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
                minimumSize: const WidgetStatePropertyAll(Size(90,35))
              ),
              child: const Row(children: [
                
                Text(
                  'Apply Now',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(Icons.arrow_right,color: Colors.white,)
              ],))
            ],
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black12,
            margin: const EdgeInsets.symmetric(horizontal: 12),
          ),
          const Row(
            children: [
              Expanded(child: 
              Row(
                children: [
                  Icon(Icons.notifications_active,color: Colors.green,size: 11,),
                  Text('Actively Hiring', style: TextStyle(color: Colors.green,fontSize: 10),),
                ],
              ),
              ),
              Row(
                children: [
                  Icon(Icons.watch,color: Colors.green,size: 11,),
                  Text('6 days ago', style: TextStyle(color: Colors.green,fontSize: 10),),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
