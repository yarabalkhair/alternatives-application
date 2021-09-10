import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();

}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _SugarFree = false;
  bool _SodiumFree = false;
  bool _NutFree = false;
  bool _SesameFree = false;
  bool _TransFatFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _SugarFree = widget.currentFilters['sugar'];
    _SodiumFree = widget.currentFilters['soduim'];
    _NutFree = widget.currentFilters['nuts'];
    _SesameFree = widget.currentFilters['sesame'];
    _TransFatFree=widget.currentFilters['trasfat'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title,
      String description,
      bool currentValue,
      Function updateValue,
      ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Restrictions'),
        actions: <Widget>[
          IconButton(
          icon: const Icon(Icons.arrow_right),

            onPressed: () async {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'sugar': _SugarFree,
                'soduim': _SodiumFree,
                'nuts': _NutFree,
                'sesame': _SesameFree,
                'trasfat': _TransFatFree
              };
              widget.saveFilters(selectedFilters);
              var current_user = await FirebaseAuth.instance.currentUser;

              if (_glutenFree.toString() == 'true') {
                print(current_user.uid);
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'glutenFree': 'glutenFree'}
                },SetOptions(merge : true));
              }
              if (_vegetarian.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'vegetarian': 'vegetarian'}
                },SetOptions(merge : true));
              }
              ;
              if (_vegan.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'vegan': 'vegan'}
                },SetOptions(merge : true));
              }
              ;
              if (_lactoseFree.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'lactoseFree': 'lactoseFree'}
                },SetOptions(merge : true));
              }
              ;
              if (_SugarFree.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'SugarFree': 'SugarFree'}
                },SetOptions(merge : true));
              }
              ;
              if (_SodiumFree.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'SodiumFree': 'SodiumFree'}
                },SetOptions(merge : true));
              }
              ;
              if (_NutFree.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'NutFree': 'NutFree'}
                },SetOptions(merge : true));
              }
              ;
              if (_SesameFree.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'SesameFree': 'SesameFree'}
                },SetOptions(merge : true));
              }
              ;
              if (_TransFatFree.toString() == 'true') {
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(current_user.uid)
                    .set({
                  'restriction': {'TransFatFree': 'TransFatFree'}
                }, SetOptions(merge : true));
              }
              ;
            },

            ),

        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Food Restrictions',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free products.',
                  _glutenFree,
                      (newValue) {
                    setState(
                          () {
                        _glutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free products.',
                  _lactoseFree,
                      (newValue) {
                    setState(
                          () {
                        _lactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian products.',
                  _vegetarian,
                      (newValue) {
                    setState(
                          () {
                        _vegetarian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan products.',
                  _vegan,
                      (newValue) {
                    setState(
                          () {
                        _vegan = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Sugar-free',
                  'Only include Sugar free products.',
                  _SugarFree,
                      (newValue) {
                    setState(
                          () {
                        _SugarFree = newValue;
                      },
                    );
                  },
                ),

                _buildSwitchListTile(
                  'Sodium-free',
                  'Only include Sodium free products.',
                  _SodiumFree,
                      (newValue) {
                    setState(
                          () {
                        _SodiumFree = newValue;
                      },
                    );
                  },
                ),


                _buildSwitchListTile(
                  'Nut-free',
                  'Only include Nut free products.',
                  _NutFree,
                      (newValue) {
                    setState(
                          () {
                        _NutFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'Sesame-free',
                  'Only include Sesame free products.',
                  _SesameFree,
                      (newValue) {
                    setState(
                          () {
                        _SesameFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'TrasFat-free',
                  'Only include TrasFat free products.',
                  _TransFatFree,
                      (newValue) {
                    setState(
                          () {
                        _TransFatFree = newValue;
                      },
                    );
                  },
                ),
              ],

            ),
          ),
        ],
      ),
    );
  }
}