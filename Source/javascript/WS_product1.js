 var slideIndex = 1;
 showPages(slideIndex);

 function plusDivs(n) {
     showPages(slideIndex += n);
 }

 function currentPage(n) {
     showPages(slideIndex = n);
 }

 function showPages(n) {
     var i;
     var x = document.getElementsByClassName("myPages");
     var dots = document.getElementsByClassName("btn-page");
     if (n > x.length) {
         slideIndex = 1
     }
     if (n < 1) {
         slideIndex = x.length
     }
     for (i = 0; i < x.length; i++) {
         x[i].style.display = "none";
     }
     for (i = 0; i < dots.length; i++) {
         dots[i].className = dots[i].className.replace(" detail-active", "");
     }
     x[slideIndex - 1].style.display = "block";
     dots[slideIndex - 1].className += " detail-active";
 }