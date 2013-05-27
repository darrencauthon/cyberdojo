/*global $,cyberDojo*/

var cyberDojo = (function(cd, $) {
  "use strict";

  cd.dialog_cantFindDojo = function(id) {
    var cantFindDojo = 
      '<div class="panel">'
      + '<table>'
      +    '<tr>'
      +      '<td>'
      +        "I can't find a cyber-dojo with that id."
      +      '</td>'
      +    '</tr>'
      +  '</table>'
      + '</div>';
    var width, title;
    return cd.dialog(cantFindDojo, width = 400, title = id + ' ?');
  };

  return cd;
})(cyberDojo || {}, $);
