//= require jquery
//= require jquery_ujs
//= require masonry

function doMasonry() {
  $.when($('#stream').masonry({
    itemSelector: '.tile',
    columnWidth: 165,
    isResizable: true,
    isFitWidth: false
  })).then(function(){
    $("section").addClass("done")
  });
}

function navigate(section) {
  window.scrollTo(0,0)

  if (section == "" && window.location.pathname == "/") {
    $("#featured").removeClass('hidden')
    $("aside li.home").addClass("active").parent().siblings().children().removeClass("active")
    $('.tile').removeClass("hidden")
    $('.featured').addClass('hidden')
  } else {
    $("#featured").addClass("hidden")
    var selector = $("li").filter(function(){
      return $(this).html().toLowerCase() == window.location.hash.substr(1,window.location.hash.length)
    }).addClass("active")
    $('.tile').addClass("hidden")
    $("." + selector.attr("data-selector")).removeClass("hidden")
    selector.parent().siblings().children().removeClass("active")
  }

  doMasonry()
}

$(function(){
  // Load initial section
  navigate(window.location.hash)

  // Active nav links handling
  if (window.location.pathname.split("/")[1] != "") {
    $("aside li." + window.location.pathname.split("/")[1]).addClass("active")
  }

  // View original-size imaged
  $("article img").click(function(){
    if ($(this).hasClass("zoomed")) {
      $("aside").removeAttr("style")
      $(this).css({
        'max-width': "610px",
        'width': "100%",
        'margin-left': 0
      }).removeClass("zoomed");
    } else {
      $("article img").css({
        'max-width': "610px",
        'width': "100%",
        'margin-left': 0
      }).removeClass("zoomed");
      $(this).css({
        'max-width': $(this).get(0).naturalWidth / 2,
        'width': $(this).get(0).naturalWidth / 2,
        'margin-left': (-(($(this).get(0).naturalWidth / 2) - 610) / 2)
      }).addClass("zoomed");
      $("aside").css("margin-left",-(($(this).width() / 2) + 250))
    }
  });

  // Hashchange handling & navigation
  if (("onhashchange" in window) && !($.browser.msie)) {
    window.onhashchange = function () {
      navigate(window.location.hash)
    }
  }
  else {
    var prevHash = window.location.hash;
    window.setInterval(function () {
      if (window.location.hash != prevHash) {
        navigate(window.location.hash)
      }
    }, 100);
  }
});