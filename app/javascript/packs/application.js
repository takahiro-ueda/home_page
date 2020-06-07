/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')
//= require popper
//= require bootstrap
//= require_tree .

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require("trix")
require("@rails/actiontext")


$(document).on('turbolinks:load', function() {
  $('.content__image').not('.slick-initialized').slick({
    // arrows: false,
    // autoplay: true,
    // autoplaySpeed: 0,
    // speed: 7000,
    // cssEase: "linear",
    // pauseOnHover: true

    infinite: true, //スライドのループ有効化
    dots:true, //ドットのナビゲーションを表示
    centerMode: true, //要素を中央寄せ
    centerPadding:'10%', //両サイドの見えている部分のサイズ
    autoplay:true, //自動再生
  });
});
