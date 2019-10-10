(function ($) {
"use strict";

/*----- 
	Mobile Menu 
-----------------------------------*/
$('.mobile-menu nav').meanmenu({
	meanScreenWidth: "990",
	meanMenuContainer: ".mobile-menu",
	meanMenuClose: '<i class="mo-cross"></i>',
});

/*----- 
	Search & Minicart Open on Click 
-------------------------------------*/
$(".search-btn").on("click", function(){
	$(".search-form").toggleClass("active");
});
$(".cart-btn").on("click", function(){
	$(this).toggleClass("active");
	$(this).parent().toggleClass("active");
	$(".headercart-wrapper").toggleClass("active");
});

/*----- 
	tab Product Slider 
------------------------------------*/
$('.tab-pro-slider').slick({
 arrows: true,
  prevArrow: '<button type="button" class="slick-prev pro-slick-prev"><i class="mo-long-attow-left"></i></button>',
  nextArrow: '<button type="button" class="slick-next pro-slick-next"><i class="mo-long-attow-right"></i></button>',
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 4,
  responsive: [
    {
      breakpoint: 1169,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3,
      }
    },
    {
      breakpoint: 969,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,
      }
    },
    {
      breakpoint: 767,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    },
  ]
});

/*----- 
	Promo Product Slider 
----------------------------------*/
$('.promo-pro-slider').slick({
 arrows: true,
  prevArrow: '<button type="button" class="slick-prev promo-slick-prev"><i class="mo-long-attow-left"></i></button>',
  nextArrow: '<button type="button" class="slick-next promo-slick-next"><i class="mo-long-attow-right"></i></button>',
  speed: 300,
  slidesToShow: 3,
  slidesToScroll: 1,
  responsive: [
    {
      breakpoint: 1169,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2,
      }
    },
    {
      breakpoint: 969,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});

/*----- 
	Blog Slider 
---------------------------------*/
$('.blog-slider').slick({
arrows: true,
  prevArrow: '<button type="button" class="slick-prev pro-slick-prev"><i class="mo-long-attow-left"></i></button>',
  nextArrow: '<button type="button" class="slick-next pro-slick-next"><i class="mo-long-attow-right"></i></button>',
  speed: 300,
  slidesToShow: 2,
  slidesToScroll: 1,
  responsive: [
    {
      breakpoint: 1169,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
      }
    },
  ]
});

/*----- 
	Brand Slider 
-------------------------------*/
$('.brand-slider').slick({
  speed: 300,
  slidesToShow: 4,
  slidesToScroll: 1,
  prevArrow: '<button type="button" class="slick-prev"><i class="mo-long-attow-left"></i></button>',
  nextArrow: '<button type="button" class="slick-next"><i class="mo-long-attow-right"></i></button>',
  responsive: [
    {
      breakpoint: 1169,
      settings: {
        slidesToShow: 3,
        slidesToScroll: 3
      }
    },
    {
      breakpoint: 991,
      settings: {
        slidesToShow: 2,
        slidesToScroll: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1
      }
    }
  ]
});

/*----- 
	Shop Page Slider 
----------------------------------*/
$('.shop-page-slider').slick({
  arrows: false,
  dots: true,
  fade: true,
  speed: 300,
  slidesToShow: 1,
  slidesToScroll: 1,
});

/*----- 
	Cart Plus Minus Button For Product Details 1 
----------------------------------------------*/	
$(".cart-plus-minus").append('<button class="inc qtybutton"><i class="mo-caret-up"></i></button>');
$(".cart-plus-minus").append('<button class="dec qtybutton"><i class="mo-caret-down"></i></button>');
$(".qtybutton").on("click", function() {
	var $button = $(this);
	var oldValue = $button.parent().find("input").val();
	if ($button.hasClass('inc')) {
	  var newVal = parseFloat(oldValue) + 1;
	} else {
	   // Don't allow decrementing below zero
	  if (oldValue > 0) {
		var newVal = parseFloat(oldValue) - 1;
		} else {
		newVal = 0;
	  }
	  }
	$button.parent().find("input").val(newVal);
});

/*----- 
	Cart Plus Minus Button 
------------------------------------*/	
$(".cart-qty, .cart-plus-minus-2").prepend('<span class="dec qtybtn">-</span>');
$(".cart-qty, .cart-plus-minus-2").append('<span class="inc qtybtn">+</span>');
$(".qtybtn").on("click", function() {
	var $button = $(this);
	var oldValue = $button.parent().find("input").val();
	if ($button.hasClass('inc')) {
	  var newVal = parseFloat(oldValue) + 1;
	} else {
	   // Don't allow decrementing below zero
	  if (oldValue > 0) {
		var newVal = parseFloat(oldValue) - 1;
		} else {
		newVal = 0;
	  }
	  }
	$button.parent().find("input").val(newVal);
});	

/*----- 
	Scroll Up 
-------------------------------------*/
$.scrollUp({
	scrollText: '<i class="mo-long-attow-up"></i>',
	easingType: 'linear',
	scrollSpeed: 900,
	animation: 'fade'
});

/*----- 
	Category Sidebar Treeview 
-------------------------------------*/
$("#cat-treeview ul").treeview({
	animated: "normal",
	persist: "location",
	collapsed: true,
	unique: true,
});

/*----- 
	Get Arrow Icon In Treeview 
-------------------------------------*/
$('<i class="mo-caret-right"></i>').appendTo('.hitarea');

/*----- 
	Get Down Arrow For Expanded List 
------------------------------------*/
if($('.product-cat > ul > li').hasClass('collapsable')){
	$('.collapsable .hitarea i').addClass('mo-caret-down').removeClass('mo-caret-right');
};

/*----- 
	Change Arrow Icon onClick 
-----------------------------------*/
$('.hitarea').on('click', function(){
	if($(this).find('i').hasClass('mo-caret-down')){
		$(this).find('i').addClass('mo-caret-right').removeClass('mo-caret-down');
	}else{
		$('.hitarea i').addClass('mo-caret-right').removeClass('mo-caret-down');
		$(this).find('i').addClass('mo-caret-down').removeClass('mo-caret-right');
	}
});

/*----- 
	Price Slider 
-------------------------------*/	
$( "#slider-range" ).slider({
   range: true,
   min: 0,
   max: 800,
   values: [ 90, 250 ],
   slide: function( event, ui ) {
	$( "#price-amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
   }
  });
$( "#price-amount" ).val( "$" + $( "#slider-range" ).slider( "values", 0 ) +
   " - $" + $( "#slider-range" ).slider( "values", 1 ) ); 
   
/*----- 
	Product Brand NiceScroll 
--------------------------------*/
$(".product-brand").niceScroll({
	cursorcolor:"#9b9b9c",
});		

/*----- 
	Cart Page tab List 
----------------------------------*/
$('.cart-page-tablist ul li a').on("click", function(){
	$(this).addClass("active");
	$(this).parent('li').prevAll('li').find('a').addClass("active");
	$(this).parent('li').nextAll('li').find('a').removeClass("active");
});

/*----- 
	Payment Select 
------------------------------------*/
$('.single-payment .select-btn').on("click", function(){
	$('.single-payment .select-btn').removeClass("active");
	$(this).addClass("active");
});

/*----- 
	Check Out Accordion 
-------------------------------------*/
$(".panel-heading a").on("click", function(){
	$(".panel-heading a").removeClass("active");
	$(this).addClass("active");
});	
	
})(jQuery);	