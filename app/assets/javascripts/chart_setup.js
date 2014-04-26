function drawCharts() {

  // DIAGNOSTICS

  // $('.analysis-data canvas').each(function(){
  //   var height = $(this).height();
  //   var width = $(this).width();
  //   var ratio = height/width;
  //   console.log('height: '+height+', width: '+width+', ratio: '+ratio);
  //   console.log($(this).parent().innerWidth());
  // });


  // CHART: BATTING AVERAGES

  if ($("#batting-averages").length) {
    // Get context with jQuery - using jQuery's .get() method.
    var ba_ctx = $("#batting-averages canvas").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.

    var ba_data = {
      labels : ["April","May","June","July","August","September","October"],
      datasets : [
        {
          fillColor : "rgba(21,21,151,0)",
          strokeColor : "rgba(20,20,20,.8)",
          pointColor : "rgba(255,255,255,1)",
          pointStrokeColor : "rgba(20,20,20,.8)",
          data : [.220,.280,.270,.220,.290,.320,.330]
        },
        {
          fillColor : "rgba(15,108,26,0)",
          strokeColor : "rgba(15,108,26,.8)",
          pointColor : "rgba(255,255,255,1)",
          pointStrokeColor : "rgba(15,108,26,.8)",
          data : [.250,.240,.230,.240,.220,.310,.360]
        },
        {
          fillColor : "rgba(253,227,141,0)",
          strokeColor : "rgba(243,207,121,.8)",
          pointColor : "rgba(255,255,255,1)",
          pointStrokeColor : "rgba(243,207,121,.8)",
          data : [.260,.290,.330,.350,.380,.380,.390]
        }
      ]
    }
    var ba_options = {
      scaleOverride : true,
      scaleFontFamily : "'Gotham SSm A','Gotham SSm B'",
      scaleSteps : 5,
      scaleStepWidth : .100,
      scaleStartValue : 0,
      scaleGridLineWidth : 1,
      pointDotRadius : 5,
      pointDotStrokeWidth : 3,
      bezierCurve : false
    }

    var battingAverages = new Chart(ba_ctx).Line(ba_data,ba_options);
  }



  // CHART: RUN SCORED
  if ($("#runs-scored").length) {
    // Get context with jQuery - using jQuery's .get() method.
    var rs_ctx = $("#runs-scored canvas").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.

    var rs_data = {
      labels : ["2010","2011","2012","2013"],
      datasets : [
        {
          fillColor : "rgba(253,227,141,.6)",
          strokeColor : "rgba(243,207,121,.8)",
          data : [68,50,84,90]
        },
        {
          fillColor : "rgba(15,108,26,.6)",
          strokeColor : "rgba(15,108,26,.8)",
          data : [84,65,97,116]
        }
      ]
    }
    var rs_options = {
      scaleOverride : true,
      scaleFontFamily : "'Gotham SSm A','Gotham SSm B'",
      scaleSteps : 5,
      scaleStepWidth : 25,
      scaleStartValue : 0,
      scaleGridLineWidth : 1,
      barValueSpacing : 40
    }

    var runsScored = new Chart(rs_ctx).Bar(rs_data,rs_options);
  }
  
}

function draw_battingAverages() {
  if ($("#batting-averages").length) {
    // Get context with jQuery - using jQuery's .get() method.
    var ba_ctx = $("#batting-averages canvas").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.

    var ba_data = {
      labels : ["April","May","June","July","August","September","October"],
      datasets : [
        {
          fillColor : "rgba(21,21,151,0)",
          strokeColor : "rgba(20,20,20,.8)",
          pointColor : "rgba(255,255,255,1)",
          pointStrokeColor : "rgba(20,20,20,.8)",
          data : [.220,.280,.270,.220,.290,.320,.330]
        },
        {
          fillColor : "rgba(15,108,26,0)",
          strokeColor : "rgba(15,108,26,.8)",
          pointColor : "rgba(255,255,255,1)",
          pointStrokeColor : "rgba(15,108,26,.8)",
          data : [.250,.240,.230,.240,.220,.310,.360]
        },
        {
          fillColor : "rgba(253,227,141,0)",
          strokeColor : "rgba(243,207,121,.8)",
          pointColor : "rgba(255,255,255,1)",
          pointStrokeColor : "rgba(243,207,121,.8)",
          data : [.260,.290,.330,.350,.380,.380,.390]
        }
      ]
    }
    var ba_options = {
      scaleOverride : true,
      scaleFontFamily : "'Gotham SSm A','Gotham SSm B'",
      scaleSteps : 5,
      scaleStepWidth : .100,
      scaleStartValue : 0,
      scaleGridLineWidth : 1,
      pointDotRadius : 5,
      pointDotStrokeWidth : 3,
      bezierCurve : false
    }

    var battingAverages = new Chart(ba_ctx).Line(ba_data,ba_options);
  }
}
function draw_runsScored() {
  // CHART: RUN SCORED
  if ($("#runs-scored").length) {
    // Get context with jQuery - using jQuery's .get() method.
    var rs_ctx = $("#runs-scored canvas").get(0).getContext("2d");
    // This will get the first returned node in the jQuery collection.

    var rs_data = {
      labels : ["2010","2011","2012","2013"],
      datasets : [
        {
          fillColor : "rgba(253,227,141,.6)",
          strokeColor : "rgba(243,207,121,.8)",
          data : [68,50,84,90]
        },
        {
          fillColor : "rgba(15,108,26,.6)",
          strokeColor : "rgba(15,108,26,.8)",
          data : [84,65,97,116]
        }
      ]
    }
    var rs_options = {
      scaleOverride : true,
      scaleFontFamily : "'Gotham SSm A','Gotham SSm B'",
      scaleSteps : 5,
      scaleStepWidth : 25,
      scaleStartValue : 0,
      scaleGridLineWidth : 1,
      barValueSpacing : 40
    }

    var runsScored = new Chart(rs_ctx).Bar(rs_data,rs_options);
  }
}

$(document).ready(function(){
  // drawCharts();
});

$(window).load(function() {
  var graphInitDelay = 500;
      
  //Set up each of the inview events here.
  $("#batting-averages").on("inview",function(){
    var $this = $(this);
    $this.removeClass("notinview").off("inview");
    setTimeout(draw_battingAverages,300);
  });
  $("#runs-scored").on("inview",function(){
    var $this = $(this);
    $this.removeClass("notinview").off("inview");
    setTimeout(draw_runsScored,graphInitDelay);
  });

  
});

/**
 * author Christopher Blum
 *    - based on the idea of Remy Sharp, http://remysharp.com/2009/01/26/element-in-view-event-plugin/
 *    - forked from http://github.com/zuk/jquery.inview/
 */
(function ($) {

  var inviewObjects = {}, viewportSize, viewportOffset,
  d = document,
  w = window,
  documentElement = d.documentElement,
  expando = $.expando;

  $.event.special.inview = {
    add: function (data) {
      inviewObjects[data.guid + "-" + this[expando]] = {
        data: data,
        $element: $(this)
      };
    },

    remove: function (data) {
      try {
        delete inviewObjects[data.guid + "-" + this[expando]];
      } catch (e) {}
    }
  };

  function getViewportSize() {
    var mode, domObject, size = {
      height: w.innerHeight,
      width: w.innerWidth
    };

    // if this is correct then return it. iPad has compat Mode, so will
    // go into check clientHeight/clientWidth (which has the wrong value).
    if (!size.height) {
      mode = d.compatMode;
      if (mode || !$.support.boxModel) { // IE, Gecko
        domObject = mode === 'CSS1Compat' ?
              documentElement : // Standards
          d.body; // Quirks
          size = {
            height: domObject.clientHeight,
            width: domObject.clientWidth
          };
        }
      }

      return size;
    }

    function getViewportOffset() {
      return {
        top: w.pageYOffset || documentElement.scrollTop || d.body.scrollTop,
        left: w.pageXOffset || documentElement.scrollLeft || d.body.scrollLeft
      };
    }

    function checkInView() {

      var $elements = $(),
      elementsLength, i = 0;

      $.each(inviewObjects, function (i, inviewObject) {
        var selector = inviewObject.data.selector,
        $element = inviewObject.$element;
        $elements = $elements.add(selector ? $element.find(selector) : $element);
      });

      elementsLength = $elements.length;
      if (elementsLength) {
        viewportSize = viewportSize || getViewportSize();
        viewportOffset = viewportOffset || getViewportOffset();

        for (; i < elementsLength; i++) {
          // Ignore elements that are not in the DOM tree
          if (!$.contains(documentElement, $elements[i])) {
            continue;
          }

          var $element = $($elements[i]),
          elementSize = {
            height: $element.height(),
            width: $element.width()
          },
          elementOffset = $element.offset(),
          inView = $element.data('inview'),
          visiblePartX,
          visiblePartY,
          visiblePartsMerged;

          // Don't ask me why because I haven't figured out yet:
          // viewportOffset and viewportSize are sometimes suddenly null in Firefox 5.
          // Even though it sounds weird:
          // It seems that the execution of this function is interferred by the onresize/onscroll event
          // where viewportOffset and viewportSize are unset
          if (!viewportOffset || !viewportSize) {
            return;
          }

          if (elementOffset.top + elementSize.height > viewportOffset.top &&
            elementOffset.top < viewportOffset.top + viewportSize.height &&
            elementOffset.left + elementSize.width > viewportOffset.left &&
            elementOffset.left < viewportOffset.left + viewportSize.width) {
            visiblePartX = (viewportOffset.left > elementOffset.left ?
              'right' : (viewportOffset.left + viewportSize.width) < (elementOffset.left + elementSize.width) ?
              'left' : 'both');
            visiblePartY = (viewportOffset.top > elementOffset.top ?
              'bottom' : (viewportOffset.top + viewportSize.height) < (elementOffset.top + elementSize.height) ?
              'top' : 'both');
            visiblePartsMerged = visiblePartX + "-" + visiblePartY;
            if (!inView || inView !== visiblePartsMerged) {
              $element.data('inview', visiblePartsMerged).trigger('inview', [true, visiblePartX, visiblePartY]);
            }
          } else if (inView) {
            $element.data('inview', false).trigger('inview', [false]);
          }
        }
      }
    }

    $(w).bind("scroll resize", function () {
      viewportSize = viewportOffset = null;
    });

    // IE < 9 scrolls to focused elements without firing the "scroll" event
    if (!documentElement.addEventListener && documentElement.attachEvent) {
      documentElement.attachEvent("onfocusin", function () {
        viewportOffset = null;
      });
    }

    // Use setInterval in order to also make sure this captures elements within
    // "overflow:scroll" elements or elements that appeared in the dom tree due to
    // dom manipulation and reflow
    // old: $(window).scroll(checkInView);
    //
    // By the way, iOS (iPad, iPhone, ...) seems to not execute, or at least delays
    // intervals while the user scrolls. Therefore the inview event might fire a bit late there
    setInterval(checkInView, 250);
  })(jQuery);

