var Lightense = (function() {
  'use strict';

  var KEYCODE_ESC = 27;
  var target;
  var container;

  // Overflow variable before screen is locked
  var overflowValue;

  /* -------------------------
  /*          UTILS
  /* -------------------------*/
  function touchDevice () {
    return 'ontouchstart' in window || navigator.maxTouchPoints;
  }

  // Applys a dict of css properties to an element
  function applyProperties (target, properties) {
    for (var key in properties) {
      target.style[key] = properties[key];
    }
  }

  /* -------------------------
  /*          APP
  /* -------------------------*/
  function startTracking (passedElements) {
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

  function track (element) {
    // Apply zoom-in cursor for target images
    element.style.cursor = 'zoom-in';

    // Element needs a src at minumun
    if (element.getAttribute('data-image') || element.src) {
      element.addEventListener('click', function () {
        init(this);
      }, false);
    }
  }

  // Lock scroll on the document body
  function lockBody () {
    overflowValue = document.body.style.overflow;
    document.body.style.overflow = 'hidden';
    document.body.classList.add('lightense-open');
  }

  // Unlock scroll on the document body
  function unlockBody () {
    document.body.style.overflow = overflowValue;
    document.body.classList.remove('lightense-open');
  }

  function createViewer (background) {
    var containerProperties = {
      'backgroundColor': background,
      'display': 'flex',
      'flexDirection': 'column',
      'justifyContent': 'center',
      'width': '100%',
      'height': '100%',
      'position': 'fixed',
      'top': '0',
      'left': '0',
      'overflow': 'hidden',
      'zIndex': '2147483647',
      'padding': '2vw',
      'margin': '0',
      'webkitTransition': 'opacity 200ms ease',
      'MozTransition': 'opacity 200ms ease',
      'transition': 'opacity 200ms ease',
      'cursor': 'zoom-out',
      'opacity': '0'
    };
    container = document.createElement('div');
    container.appendChild(target);
    applyProperties(container, containerProperties);

    var imageProperties = {
      'display': 'block',
      'maxWidth': '100%',
      'maxHeight': '100%',
      'padding': '0',
      'margin': '0 auto'
    };
    applyProperties(target, imageProperties);

    document.body.appendChild(container);
    setTimeout(function () {
      container.style.opacity = '1';
    }, 10);
  }

  function removeViewer () {
    unlockBody();
    unbindEvents();

    container.style.opacity = '0';
    setTimeout(function () {
      document.body.removeChild(container);
    }, 200);
  }

  function init (element) {
    var imageSource = element.getAttribute('data-image') || element.src;
    var background = element.getAttribute('data-background') || 'rgba(255, 255, 255, 1)';
    var img = new Image();
    img.onload = function () {
      target = this;
      createViewer(background);
      lockBody();
      bindEvents();
    };

    img.src = imageSource;
  }

  function bindEvents () {
    window.addEventListener('keyup', onKeyUp, false);
    window.addEventListener('click', removeViewer, false);
  }

  function unbindEvents () {
    window.removeEventListener('keyup', onKeyUp, false);
    window.removeEventListener('click', removeViewer, false);
  }

  // Exit on excape key pressed
  function onKeyUp (event) {
    event.preventDefault();
    if (event.keyCode === KEYCODE_ESC) {
      removeViewer();
    }
  }

  function main (element) {
    // If it's a touch enabled device, do nothing, touch devices are much easier to scale images, right?
    if (touchDevice()) {
      return;
    }

    // Parse arguments
    if (!element) {
      throw 'You need to pass an element!';
    }

    startTracking(element);
  }

  return main;
})();
