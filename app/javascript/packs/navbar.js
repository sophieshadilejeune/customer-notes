import $ from 'jquery';
import 'malihu-custom-scrollbar-plugin';

const navbarToggle = () => {



  $(document).ready(function () {
// makes the sidebar sticks when scrolling down
$("#sidebar").mCustomScrollbar({
 theme: "minimal"
});

$('#sidebarCollapse').on('click', function () {
        // open or close navbar
        $('#sidebar').toggleClass('active');
        $('#content').toggleClass('active');
        // close dropdowns
        $('.collapse.in').toggleClass('in');
        // and also adjust aria-expanded attributes we use for the open/closed arrows
        // in our CSS
        $('a[aria-expanded=true]').attr('aria-expanded', 'false');
      });
});
};

export { navbarToggle };
