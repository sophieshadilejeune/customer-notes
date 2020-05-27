const sideBar = () => {

$(".sidebar-dropdown > a").click(function() {
    // event.preventDefault();
  $(".sidebar-submenu").slideUp(200);
  if (
    $(this)
      .parent()
      .hasClass("active")
  ) {
    event.preventDefault();

    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .parent()
      .removeClass("active");
    event.preventDefault();
  } else {
    event.preventDefault();

    $(".sidebar-dropdown").removeClass("active");
    $(this)
      .next(".sidebar-submenu")
      .slideDown(200);
    $(this)
      .parent()
      .addClass("active");

  }
});

$("#close-sidebar").click(function() {
  event.preventDefault();
  $(".page-wrapper").removeClass("toggled");
});
$("#show-sidebar").click(function() {
    event.preventDefault();

  $(".page-wrapper").addClass("toggled");
});

};

export { sideBar };
