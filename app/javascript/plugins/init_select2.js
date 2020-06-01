import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.js-example-basic-single').select2({
      placeholder: "Find a customer by Product",
    allowClear: true,
   width: '100%'
  });

};


export { initSelect2 };
