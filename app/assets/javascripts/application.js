//= require jquery
//= require jquery_ujs
//= require masonry

var timer,
  tip = $("#just-the-tip"),
  doTooltip = true

function doMasonry() {
  if ($(window).width() >= 668) {
    $.when($('#stream').masonry({
      itemSelector: '.tile',
      columnWidth: 165,
      isResizable: true,
      isFitWidth: false
    })).then(function(){
      $("section").addClass("done")
    });
  } else {
    $("section").addClass("done")
    $(".tile").addClass("masonry-brick").removeAtt("style")
  }
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

  doTooltip = false

  setTimeout(function(){
    doTooltip = true
  },100)

  setTooltip()

  tip.addClass("hidden").removeClass("active")
  setTimeout(function(){
    tip.removeClass("hidden")
  },350)
}

function setTooltip() {
  clearTimeout(timer)

  if ($(document).height() > $(window).height() && doTooltip == true) {
   	var viewportHeight = $(window).height(),
  		documentHeight = $(document).height(),
  		pxScrolled = $(document).scrollTop(),
      progress = pxScrolled / (documentHeight - viewportHeight),
  		scrollbarHeight = viewportHeight / documentHeight * viewportHeight,
  		tooltip = tip,
  		distance = progress * (viewportHeight - scrollbarHeight) + (scrollbarHeight / 2) - (tooltip.height() / 2),
  		timestamp = $(document.elementFromPoint($(document).width() / 2, distance)).parents(".tile").attr("data-timestamp")

    tip.css("top", distance + "px").addClass("active")
    if (timestamp != "" && timestamp != undefined) { tip.find("span:last-of-type").html(timestamp + " ago") }

    if (pxScrolled > 0) {
      tip.addClass("active")
    }

  	timer = setTimeout(function(){
    	tip.removeClass("active")
  	}, 550)
  }
}

function getTweetCount() {
  $.ajax({
    url: "http://cdn.api.twitter.com/1/urls/count.json?url=" + encodeURIComponent(document.location.href),
    dataType: "JSONP",
    success: function(data) {
      console.log(data.count)
      $(".twitter.count").html(data.count)
    }
  })
}

$(function(){
  // Load initial section
  navigate(window.location.hash)

  // Active nav links styling
  if (window.location.pathname.split("/")[1] != "") {
    $("aside li." + window.location.pathname.split("/")[1]).addClass("active")
  }

  // Add target="_blank" where I forgot to
  $("article a").each(function(){
    if ($(this).attr("target") !== "_blank" && $(this).attr("href").indexOf("jacksongariety.com") == -1 && $(this).attr("href").indexOf("http://") !== -1) {
      $(this).attr("target", "_blank")
    }
  })

  // View original-size images
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
        'margin-left': ($(this).get(0).naturalWidth) > 1220 ? (-(($(this).get(0).naturalWidth / 2) - 610) / 2) : "auto"
      }).addClass("zoomed");

      sidebarMargin = -(($(this).width() / 2) + 243)

      if (sidebarMargin < -548) {
        $("aside").css("margin-left", sidebarMargin + "px")
      } else {
        $("aside").css("margin-left", -548 + "px")
      }
    }
  });

  // Get Tweet count
  if ($(".tweet").length) {
    getTweetCount()
    setInterval(getTweetCount,20000)
  }

  // Liking
  $(".heart:not(.clicked)").click(function(){
    $(".love.count").html(parseInt($(".love.count").html()) + 1)
    $(".heart").addClass("clicked").off("click")
  })

  $(".tweet:not(.clicked)").click(function(){
    $(".tweet").addClass("clicked").off("click")
  })

  // Hashchange handling for navigation
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

  // Responsiveness
  $(window).resize(function(){
    doMasonry()
  });

  // Tooltip
  $(window).scroll(function(){
    setTooltip()
  });
});