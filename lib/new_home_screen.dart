import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({Key? key}) : super(key: key);

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  TextEditingController _searchController = new TextEditingController();
  String definitions = "";
  String typeOf = "";
  String similarTo = "";
  String example = "";
  String synonym = "";
  String antonym = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/dictionary.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "WORDS API",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              textCapitalization: TextCapitalization.words,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SF Compact',
                fontWeight: FontWeight.bold,
              ),
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Colors.black,
                ),
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                labelText: "ENTER WORD",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              try {
                String fetchedDefinition = await fetchedDefinitions();
                setState(() {
                  definitions = fetchedDefinition;
                });
              } catch (error) {
                debugPrint("Error fetching definitions: $error");
              }
            },
            child: Container(
              height: 60,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  "SEARCH RESULTS",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'SF Compact',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/search.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  _searchController.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SF Compact',
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 100,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber),
            child: Center(
              child: Text(
                definitions,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/typeOf.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "TYPE OF",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            typeOf,
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'SF Compact',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 4,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 150),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/equals.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "SIMILAR TO",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            similarTo,
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'SF Compact',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 4,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 150),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/example.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "EXAMPLE",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            example,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'SF Compact',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 4,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 150),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/synonym.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "SYNONYMS",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            synonym,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'SF Compact',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 4,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(horizontal: 150),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/antonym.png",
                height: 30,
                width: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "ANTONYMS",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'SF Compact',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            antonym,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.amber,
                fontFamily: 'SF Compact',
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    )));
  }

  Future<String> fetchedDefinitions() async {
    try {
      if (_searchController.text.isEmpty) {
        print('\n\nRETURNING EMPTY STRING\n\n');
        return "";
      }
      String url =
          "https://wordsapiv1.p.rapidapi.com/words/${_searchController.text}/definitions";
      var headers = {
        'X-RapidAPI-Key': 'b1040543d1mshd012f6ad1fa0b13p15aa5djsn206872fdd655',
        'X-RapidAPI-Host': 'wordsapiv1.p.rapidapi.com'
      };
      final uri = Uri.parse(url);
      final response = await http.get(uri, headers: headers);
      var responseData = json.decode(response.body);

      if (responseData['definitions'] != null && responseData['definitions'].isNotEmpty) {
        var firstDefinition = responseData['definitions'][0]['definition'];
        return firstDefinition;
      } else {
        return "No definitions found.";
      }
    } catch (e) {
      debugPrint("Some exception occurred: " + e.toString());
      throw e;
    }
  }
}
