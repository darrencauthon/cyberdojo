/*jsl:option explicit*/

var cyberDojo = (function($cd, $j) {

  $cd.faqsPopup = function() {

    var noListen =
      $cd.divPanel(
        'No. Listen. Stop trying to go faster, start trying to go <em>slower</em>.<br/>' +
        "Don't think about finishing, think about <em>improving</em>.<br/>" +
        'Think about <em>practising</em>. As a <em>team</em>.<br/>' +
        "That's what cyber-dojo is for. Nothing else."
      );

    var add = "Why don't you add ";
    var hilight = add + "syntax highlighting ?";
    var refactor = add + "simple auto-refactoring ?";
    var any = add + "... ?";

    var grid = $j($cd.makeTable(hilight,noListen,refactor,noListen,any,noListen));
      
    $cd.dialogPopup(grid.html(), 675, 'faqs');
  };

  return $cd;
})(cyberDojo || {}, $);



