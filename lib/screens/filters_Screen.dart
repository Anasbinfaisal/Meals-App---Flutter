import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/main_drawer.dart';
import '../models/filters.dart';

class Filters_Screen extends StatefulWidget {
  static const routeName = "/filters_screen";

  late Map<String, bool> currentFilters;

  @override
  State<Filters_Screen> createState() => _Filters_ScreenState();
}

class _Filters_ScreenState extends State<Filters_Screen> {
  bool _glutenFree = false,
      _vegetarian = false,
      _vegan = false,
      _lactoseFree = false;

  // @override
  // void initState() {
  //   _glutenFree = widget.currentFilters['gluten']!;
  //   _vegetarian = widget.currentFilters['vegetarian']!;
  //   _vegan = widget.currentFilters['vegan']!;
  //   _lactoseFree = widget.currentFilters['lactose']!;
  //   // print(widget.currentFilters);
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    var element = Provider.of<Filters>(context, listen: false);
    widget.currentFilters = element.filters;
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.didChangeDependencies();
  }

  void _setFilters(Filters filters, Map<String, bool> filterData) {
    setState(() {
      filters.set_filters(filterData);
    });
  }

  @override
  Widget build(BuildContext context) {
    var element = Provider.of<Filters>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MainDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenFree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                  'lactose': _lactoseFree,
                };

                _setFilters(element, selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              'Adjust your meal selection.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                'Gluten-free',
                'Only include gluten-free meals',
                _glutenFree,
                (value) {
                  setState(() {
                    _glutenFree = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Lactose-free',
                'Only include lactose-free meals',
                _lactoseFree,
                (value) {
                  setState(() {
                    _lactoseFree = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegetarian',
                'Only include vegetarian meals',
                _vegetarian,
                (value) {
                  setState(() {
                    _vegetarian = value;
                  });
                },
              ),
              buildSwitchListTile(
                'Vegan',
                'Only include vegan meals',
                _vegan,
                (value) {
                  setState(() {
                    _vegan = value;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }

  // void update_filters(BuildContext context) {
  //   Map<String, bool> updatedFilters = Provider.of<Filters>(context).filters;
  //   _glutenFree = updatedFilters['gluten']!;
  //   _vegetarian = updatedFilters['vegetarian']!;
  //   _vegan = updatedFilters['vegan']!;
  //   _lactoseFree = updatedFilters['lactose']!;
  //
  //   print(updatedFilters);
  // }

  SwitchListTile buildSwitchListTile(
      String title, String subtitle, bool value, Function(bool) onchange) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onchange,
    );
  }
}
