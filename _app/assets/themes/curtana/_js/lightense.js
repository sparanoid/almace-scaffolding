var Lightense = function () {
  'use strict';

  var KEYCODE_ESC = 27;
  var target;
  var container;
  var date;
  var scrollY;

  function startTracking(passedElements) {
    // If passed an array of elements, assign tracking to all
    var len = passedElements.length;
    if (len) {
      // Loop and assign
      for (var i = 0; i < len; i++) {
        track(passedElements[i]);
      }
    } else {
      track(passedElements);
    }
  }

  function track(element) {
    // Element needs a src at minumun
    if (element.getAttribute('data-image') || element.src) {
      element.style.cursor = 'zoom-in';
      element.addEventListener('click', function () {
        init(this);
      }, false);
    }
  }

  // Create stylesheets
  function createStyle() {
    // Generate unique class name
    date = new Date().getTime();
    var css = '\n      .lightense-' + date + ' {\n        display: flex;\n        box-sizing: border-box;\n        flex-direction: column;\n        justify-content: center;\n        width: 100%;\n        height: 100%;\n        position: fixed;\n        top: 0;\n        left: 0;\n        overflow: hidden;\n        z-index: 2147483647;\n        padding: 2vw;\n        margin: 0;\n        transition: opacity 200ms ease;\n        cursor: zoom-out;\n        opacity: 0;\n        background-color: rgba(255, 255, 255, .98);\n        -webkit-user-select: none;\n        -moz-user-select: none;\n        -ms-user-select: none;\n        user-select: none;\n      }\n\n      @supports (-webkit-backdrop-filter: blur(30px)) {\n        .lightense-' + date + ' {\n          background-color: rgba(255, 255, 255, .6);\n          -webkit-backdrop-filter: blur(30px);\n          backdrop-filter: blur(30px);\n        }\n      }\n\n      .lightense-' + date + ' img {\n        display: block;\n        width: auto;\n        height: auto;\n        max-width: 100%;\n        max-height: 100%;\n        min-width: 0;\n        min-height: 0;\n        padding: 0;\n        margin: 0 auto;\n      }\n    ';

    var head = document.head || document.getElementsByTagName('head')[0];
    var style = document.createElement('style');
    if (style.styleSheet) {
      style.styleSheet.cssText = css;
    } else {
      style.appendChild(document.createTextNode(css));
    }
    head.appendChild(style);
  }

  function createViewer(background) {
    scrollY = window.scrollY;
    container = document.createElement('div');
    container.className = 'lightense-wrap lightense-' + date;
    container.appendChild(target);
    if (background) container.style.backgroundColor = background;

    document.body.appendChild(container);
    setTimeout(function () {
      container.style.opacity = '1';
    }, 10);
  }

  function removeViewer() {
    unbindEvents();

    container.style.opacity = '0';
    setTimeout(function () {
      document.body.removeChild(container);
    }, 200);
  }

  function checkViewer() {
    var scrollOffset = Math.abs(scrollY - window.scrollY);
    if (scrollOffset >= 50) {
      removeViewer();
    }
  }

  function init(element) {
    var imageSource = element.getAttribute('data-image') || element.src;
    var background = element.getAttribute('data-background') || false;
    var img = new Image();
    img.onload = function () {
      target = this;
      createViewer(background);
      bindEvents();
    };
    img.src = imageSource;
  }

  function bindEvents() {
    window.addEventListener('keyup', onKeyUp, false);
    window.addEventListener('scroll', checkViewer, false);
    container.addEventListener('click', removeViewer, false);
  }

  function unbindEvents() {
    window.removeEventListener('keyup', onKeyUp, false);
    window.removeEventListener('scroll', checkViewer, false);
    container.removeEventListener('click', removeViewer, false);
  }

  // Exit on excape key pressed
  function onKeyUp(event) {
    event.preventDefault();
    if (event.keyCode === KEYCODE_ESC) {
      removeViewer();
    }
  }

  function main(element) {
    // Parse arguments
    if (!element) {
      throw 'You need to pass an element!';
    }

    // Prepare stylesheets
    createStyle();

    // Pass and prepare elements
    startTracking(element);
  }

  return main;
}();
