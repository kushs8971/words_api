import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

  TextEditingController _searchController = new TextEditingController();

  String definition = '';
  String typeOf = '';
  String pronunciation = '';
  String example = '';
  String synonym = '';
  String antonym = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
                await fetchDefinition();
                setState(() { });
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
            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                          width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: SingleChildScrollView(
                          child: DefaultTextStyle(
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SF Compact',
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                            child: Text(definition,
                            ),
                          ),
                        ),
                      );
                    }
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 100,
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.amber),
                child: Center(
                  child: Text(definition,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF Compact',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
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
                  "assets/images/talk.png",
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "PRONUNCIATION",
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
              pronunciation,
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
      ),
    ));
  }

  Future<void> fetchDefinition() async {
    try {
      print('call to hua he');
      String url = 'https://api.api-ninjas.com/v1/dictionary?word=' + _searchController.text;
    print("this is url - " + url);
      final uri = Uri.parse(url);
      final response = await http.get(uri,
      headers: {
        'X-Api-Key': 'WZbDdIn3L0yZA+SNFLX9LQ==jcgBrsEp5IDF1p1N'
      }
      );
      var responseData = json.decode(response.body);
      print('I GOT THE RES - ' + responseData.toString());
      if (responseData != null && responseData.isNotEmpty) {
        var firstDefinition = responseData['definition'];
        this.definition = firstDefinition;
      }
    } catch(e) {
        print("THIS IS ERROR - " + e.toString());
    }
  }
}

