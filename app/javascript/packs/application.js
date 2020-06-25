// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require activestorage

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")




// gallery(imgs);
// notesEditing();
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { navbarToggle } from './navbar';
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initSelect2 } from '../plugins/init_select2';
import { initSlick } from '../plugins/init_slick';
import { customersFilter } from './customers_filter';

customersFilter();

// $( document ).ready(function() {
document.addEventListener('turbolinks:load', () => {
// dropdownNavbar();
navbarToggle();
initSlick();
initAutocomplete();
initSelect2();
initMapbox();
});


require("trix")
require("@rails/actiontext")
