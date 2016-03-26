var Lightense = function () {
  'use strict';

  // save some bytes

  var w = window,
      d = document;

  // global config object
  var config = {
    time: 300,
    padding: 40,
    cubicBezier: 'cubic-bezier(.2, 0, .1, 1)',
    zIndex: 2147483647
  };

  function startTracking(passedElements) {
    // if passed an array of elements, assign tracking to all
    var len = passedElements.length;
    if (len) {
      // loop and assign
      for (var i = 0; i < len; i++) {
        track(passedElements[i]);
      }
    } else {
      track(passedElements);
    }
  }

  function track(element) {
    var imageSource = element.getAttribute('data-image') || element.src;
    if (imageSource) {

      element.classList.add('lightense-target');

      element.addEventListener('click', function (event) {

        // if Command (OS X) or Ctrl (Windows) key pressed, stop processing and
        // open the image in new tab
        if (event.metaKey || event.ctrlKey) {
          return w.open(imageSource, '_blank');
        }

        // init instance
        init(this);
      }, false);
    }
  }

  function createStyle() {
    var css = '\n      .lightense-backdrop {\n        box-sizing: border-box;\n        width: 100%;\n        height: 100%;\n        position: fixed;\n        top: 0;\n        left: 0;\n        overflow: hidden;\n        z-index: ' + (config.zIndex - 1) + ';\n        padding: 0;\n        margin: 0;\n        transition: opacity ' + config.time + 'ms ease;\n        cursor: zoom-out;\n        opacity: 0;\n        background-color: rgba(255, 255, 255, .98);\n        visibility: hidden;\n      }\n\n      @supports (-webkit-backdrop-filter: blur(30px)) {\n        .lightense-backdrop {\n          background-color: rgba(255, 255, 255, .6);\n          -webkit-backdrop-filter: blur(30px);\n          backdrop-filter: blur(30px);\n        }\n      }\n\n      .lightense-wrap {\n        position: relative;\n        transition: transform ' + config.time + 'ms ' + config.cubicBezier + ';\n        z-index: ' + config.zIndex + ';\n        -webkit-user-select: none;\n        user-select: none;\n      }\n\n      .lightense-target {\n        cursor: zoom-in;\n        transition: transform ' + config.time + 'ms ' + config.cubicBezier + ';\n      }\n\n      .lightense-open {\n        cursor: zoom-out;\n      }\n\n      .lightense-transitioning {\n        pointer-events: none;\n      }\n    ';

    var head = d.head || d.getElementsByTagName('head')[0];
    var style = d.createElement('style');
    if (style.styleSheet) {
      style.styleSheet.cssText = css;
    } else {
      style.appendChild(d.createTextNode(css));
    }
    head.appendChild(style);
  }

  function createBackdrop() {
    config.container = d.createElement('div');
    config.container.className = 'lightense-backdrop';
    d.body.appendChild(config.container);
  }

  function createTransform(img) {
    // get original image size
    var naturalWidth = img.width;
    var naturalHeight = img.height;

    // calc zoom ratio
    var scrollTop = w.pageYOffset || d.documentElement.scrollTop || 0;
    var scrollLeft = w.pageXOffset || d.documentElement.scrollLeft || 0;
    var targetImage = config.target.getBoundingClientRect();
    var maxScaleFactor = naturalWidth / targetImage.width;
    var viewportWidth = w.innerWidth || d.documentElement.clientWidth || 0;
    var viewportHeight = w.innerHeight || d.documentElement.clientHeight || 0;
    var viewportWidthOffset = viewportWidth - config.padding;
    var viewportHeightOffset = viewportHeight - config.padding;
    var imageRatio = naturalWidth / naturalHeight;
    var viewportRatio = viewportWidthOffset / viewportHeightOffset;

    if (naturalWidth < viewportWidthOffset && naturalHeight < viewportHeightOffset) {
      config.scaleFactor = maxScaleFactor;
    } else if (imageRatio < viewportRatio) {
      config.scaleFactor = viewportHeightOffset / naturalHeight * maxScaleFactor;
    } else {
      config.scaleFactor = viewportWidthOffset / naturalWidth * maxScaleFactor;
    }

    // calc animation
    var translateX, translateY;
    var viewportX = viewportWidth / 2;
    var viewportY = scrollTop + viewportHeight / 2;
    var imageCenterX = targetImage.left + scrollLeft + targetImage.width / 2;
    var imageCenterY = targetImage.top + scrollTop + targetImage.height / 2;

    config.translateX = viewportX - imageCenterX;
    config.translateY = viewportY - imageCenterY;
  }

  function createViewer() {
    config.target.classList.add('lightense-open');

    // create wrapper element
    config.wrap = d.createElement('div');
    config.wrap.className = 'lightense-wrap';

    // apply zoom ratio to target image
    setTimeout(function () {
      config.target.style.transform = 'scale(' + config.scaleFactor + ')';
    });

    // apply animation to outer wrapper
    config.target.parentNode.insertBefore(config.wrap, config.target);
    config.wrap.appendChild(config.target);
    setTimeout(function () {
      config.wrap.style.transform = 'translate3d(' + config.translateX + 'px, ' + config.translateY + 'px, 0)';
    });

    // show backdrop
    if (config.background) config.container.style.backgroundColor = config.background;
    config.container.style.visibility = 'visible';
    setTimeout(function () {
      config.container.style.opacity = '1';
    });
  }

  function removeViewer() {
    unbindEvents();

    config.target.classList.remove('lightense-open');

    // remove transform styles
    config.wrap.style.transform = '';
    config.target.style.transform = '';
    config.target.classList.add('lightense-transitioning');

    // fadeout backdrop
    config.container.style.opacity = '';

    // hide backdrop and remove target element wrapper
    setTimeout(function () {
      config.container.style.visibility = '';
      config.container.style.backgroundColor = '';
      config.wrap.parentNode.replaceChild(config.target, config.wrap);
      config.target.classList.remove('lightense-transitioning');
    }, config.time);
  }

  function checkViewer() {
    var scrollOffset = Math.abs(config.scrollY - w.scrollY);
    if (scrollOffset >= 30) {
      removeViewer();
    }
  }

  function init(element) {
    config.target = element;

    // TODO: need refine
    // if element already openned, close it
    if (config.target.classList.contains('lightense-open')) {
      return removeViewer();
    }

    // save current window scroll position for later use
    config.scrollY = w.scrollY;

    // save target attributes
    config.src = element.getAttribute('data-image') || element.src;
    config.background = config.target.getAttribute('data-background') || false;

    var img = new Image();
    img.onload = function () {
      createTransform(this);
      createViewer();
      bindEvents();
    };
    img.src = config.src;
  }

  function bindEvents() {
    w.addEventListener('keyup', onKeyUp, false);
    w.addEventListener('scroll', checkViewer, false);
    config.container.addEventListener('click', removeViewer, false);
  }

  function unbindEvents() {
    w.removeEventListener('keyup', onKeyUp, false);
    w.removeEventListener('scroll', checkViewer, false);
    config.container.removeEventListener('click', removeViewer, false);
  }

  // exit on excape (esc) key pressed
  function onKeyUp(event) {
    event.preventDefault();
    if (event.keyCode === 27) {
      removeViewer();
    }
  }

  function main(elements, cfg) {
    // parse arguments
    if (!elements) {
      throw 'You need to pass an element!';
    }

    // get user configs
    var userConfig = cfg || {};
    if (userConfig.time) {
      config.time = userConfig.time;
    }

    // prepare stylesheets
    createStyle();

    // prepare backdrop element
    createBackdrop();

    // pass and prepare elements
    startTracking(elements);
  }

  return main;
}();
