////khai báo biến slideIndex đại diện cho slide hiện tại
//var slideIndex;
//// KHai bào hàm hiển thị slide
//function showSlides() {
//    var i;
//    var slides = document.getElementsByClassName("mySlides");
//    var dots = document.getElementsByClassName("dot");
//    for (i = 0; i < slides.length; i++) {
//        slides[i].style.display = "none";
//    }
//    for (i = 0; i < dots.length; i++) {
//        dots[i].className = dots[i].className.replace(" active", "");
//    }
//
//    slides[slideIndex].style.display = "block";
//    dots[slideIndex].className += " active";
//    //chuyển đến slide tiếp theo
//    slideIndex++;
//    //nếu đang ở slide cuối cùng thì chuyển về slide đầu
//    if (slideIndex > slides.length - 1) {
//        slideIndex = 0
//    }
//    //tự động chuyển đổi slide sau 5s
//    setTimeout(showSlides, 1000);
//}
////mặc định hiển thị slide đầu tiên 
//showSlides(slideIndex = 0);
//
//
//function currentSlide(n) {
//    showSlides(slideIndex = n);
//}

var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    for (i = 0; i < 2; i++) {
        slides[i].style.display = "none"; 
    }
    slideIndex++;
    if (slideIndex > 2) {slideIndex = 1} 
    slides[slideIndex-1].style.display = "block"; 
    setTimeout(showSlides, 8000); // Change image every 2 seconds
}
