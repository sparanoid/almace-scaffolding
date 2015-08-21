// Custom user scripts

// Quote marks fix
// TODO: need better implement
+function addMarginFix() {
  var para = document.querySelectorAll("p, li");

  for (var i = 0; i < para.length; i++) {
    var firstLetter = para[i].innerHTML.trim().charAt(0);
    var regex = /「|『|“/;

    if (firstLetter.match(regex)) {
      para[i].className += ' ' + "leading-indent-fix";
    }
  }
}();
