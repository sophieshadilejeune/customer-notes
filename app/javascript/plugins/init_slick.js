import slick from 'slick-carousel'

const initSlick = () => {
$(document).ready(function(){
  $('.banners').slick({
  infinite: false,
  vertical:true,
  arrows: true,
  verticalSwiping:true,
  slidesToShow: 1,
  slidesToScroll: 1,
  prevArrow: $('.top-arrow'),
  nextArrow: $('.bottom-arrow')
  });
});

}
export { initSlick }
