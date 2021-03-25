jQuery(document).ready(function ($) {
    // Scroll to the desired section on click
    // Make sure to add the `data-scroll` attribute to your `<a>` tag.
    // Example: 
    // `<a data-scroll href="#my-section">My Section</a>` will scroll to an element with the id of 'my-section'.
    function scrollToSection(event) {
        event.preventDefault();
        var $section = $($(this).attr('href'));
        $('html, body').animate({
            scrollTop: $section.offset().top - 150
        }, 400);
    }
    $("#search-student").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $(".student-list *").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
    $('[data-scroll]').on('click', scrollToSection);
    $(".panel").click(function () {
        $(".panel-list").animate({
            width: "toggle"
        });
        $("h3").css("display", "none");
    });
    
    

}(jQuery));
window.onscroll = function () {
    myFunction()
};

// Get the header
var header = document.getElementById("header");

// Get the offset position of the navbar
var sticky = header.offsetTop;

// Add the sticky class to the header when you reach its scroll position. Remove "sticky" when you leave the scroll position
function myFunction() {
    if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
    } else {
        header.classList.remove("sticky");
    }
}