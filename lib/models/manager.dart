import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:q_shop/icons.dart';

class Manager{
  HashMap icons = new HashMap<String, IconData>();
  Manager(){
    icons = {'zitrone': zitrone, 'birne' : birne, 'apfel': apfel, 'banane': banane,
    'kirsche': kirsche, 'trauben' : trauben,
    'tomate': tomate, 'karotte': karotte, 'wurst': wurst, 'fleisch': fleisch, 'fleisch2': fleisch2,
    'huhn': huhn, 'fisch': fisch,
    'kaese': kaese, 'ei': ei, 'milch': milch,
    'mehl': mehl,
    'toast': toast, 'brot': brot, 'brezel': brezel, 'weckle': weckle, 'aehre': aehre,
    'nudel': nudel, 'nudel2': nudel2, 'pizza': pizza,
    'loli': loli, 'keks': keks, 'eis': eis, 'eis2': eis2, 'bonbon': bonbon,
    } as HashMap;
  }
  IconData getItemIcon(String iconName){
    if(icons.containsKey(iconName)){
      return icons[iconName];
    }else{
      return icons['apfel'];
    }
  }
}