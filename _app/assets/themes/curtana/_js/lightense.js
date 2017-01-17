/*! lightense-images v1.0.3 | © Tunghsiao Liu | MIT */
(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["Lightense"] = factory();
	else
		root["Lightense"] = factory();
})(this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

	'use strict';

	var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

	var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

	var Lightense = function Lightense() {
	  'use strict';

	  // Save some bytes

	  var w = window;
	  var d = document;

	  // default options
	  var defaults = {
	    time: 300,
	    padding: 40,
	    offset: 40,
	    keyboard: true,
	    cubicBezier: 'cubic-bezier(.2, 0, .1, 1)',
	    zIndex: 2147483647
	  };

	  // Init user options
	  var config = {};

	  // Init target elements
	  var elements;

	  function getElements(elements) {
	    switch (typeof elements === 'undefined' ? 'undefined' : _typeof(elements)) {
	      case 'undefined':
	        throw 'You need to pass an element!';

	      case 'string':
	        return document.querySelectorAll(elements);

	      case 'object':
	        return elements;
	    }
	  }

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
	    if (element.src) {
	      element.classList.add('lightense-target');
	      element.addEventListener('click', function (event) {
	        if (config.keyboard) {
	          // If Command (macOS) or Ctrl (Windows) key pressed, stop processing
	          // and open the image in a new tab
	          if (event.metaKey || event.ctrlKey) {
	            return w.open(element.src, '_blank');
	          }
	        }

	        // Init instance
	        init(this);
	      }, false);
	    }
	  }

	  function createStyle() {
	    var css = '\n      .lightense-backdrop {\n        box-sizing: border-box;\n        width: 100%;\n        height: 100%;\n        position: fixed;\n        top: 0;\n        left: 0;\n        overflow: hidden;\n        z-index: ' + (config.zIndex - 1) + ';\n        padding: 0;\n        margin: 0;\n        transition: opacity ' + config.time + 'ms ease;\n        cursor: zoom-out;\n        opacity: 0;\n        background-color: rgba(255, 255, 255, .98);\n        visibility: hidden;\n      }\n\n      @supports (-webkit-backdrop-filter: blur(30px)) {\n        .lightense-backdrop {\n          background-color: rgba(255, 255, 255, .6);\n          -webkit-backdrop-filter: blur(30px);\n          backdrop-filter: blur(30px);\n        }\n      }\n\n      .lightense-wrap {\n        position: relative;\n        transition: transform ' + config.time + 'ms ' + config.cubicBezier + ';\n        z-index: ' + config.zIndex + ';\n        pointer-events: none;\n      }\n\n      .lightense-target {\n        cursor: zoom-in;\n        transition: transform ' + config.time + 'ms ' + config.cubicBezier + ';\n        pointer-events: auto;\n      }\n\n      .lightense-open {\n        cursor: zoom-out;\n      }\n\n      .lightense-transitioning {\n        pointer-events: none;\n      }\n    ';

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
	    // Get original image size
	    var naturalWidth = img.width;
	    var naturalHeight = img.height;

	    // Calc zoom ratio
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

	    // Calc animation
	    var viewportX = viewportWidth / 2;
	    var viewportY = scrollTop + viewportHeight / 2;
	    var imageCenterX = targetImage.left + scrollLeft + targetImage.width / 2;
	    var imageCenterY = targetImage.top + scrollTop + targetImage.height / 2;

	    config.translateX = viewportX - imageCenterX;
	    config.translateY = viewportY - imageCenterY;
	  }

	  function createViewer() {
	    config.target.classList.add('lightense-open');

	    // Create wrapper element
	    config.wrap = d.createElement('div');
	    config.wrap.className = 'lightense-wrap';

	    // Apply zoom ratio to target image
	    setTimeout(function () {
	      config.target.style.transform = 'scale(' + config.scaleFactor + ')';
	    }, 20);

	    // Apply animation to outer wrapper
	    config.target.parentNode.insertBefore(config.wrap, config.target);
	    config.wrap.appendChild(config.target);
	    setTimeout(function () {
	      config.wrap.style.transform = 'translate3d(' + config.translateX + 'px, ' + config.translateY + 'px, 0)';
	    }, 20);

	    // Show backdrop
	    if (config.background) config.container.style.backgroundColor = config.background;
	    config.container.style.visibility = 'visible';
	    setTimeout(function () {
	      config.container.style.opacity = '1';
	    }, 20);
	  }

	  function removeViewer() {
	    unbindEvents();

	    config.target.classList.remove('lightense-open');

	    // Remove transform styles
	    config.wrap.style.transform = '';
	    config.target.style.transform = '';
	    config.target.classList.add('lightense-transitioning');

	    // Fadeout backdrop
	    config.container.style.opacity = '';

	    // Hide backdrop and remove target element wrapper
	    setTimeout(function () {
	      config.container.style.visibility = '';
	      config.container.style.backgroundColor = '';
	      config.wrap.parentNode.replaceChild(config.target, config.wrap);
	      config.target.classList.remove('lightense-transitioning');
	    }, config.time);
	  }

	  function checkViewer() {
	    var scrollOffset = Math.abs(config.scrollY - w.scrollY);
	    if (scrollOffset >= config.offset) {
	      removeViewer();
	    }
	  }

	  function init(element) {
	    config.target = element;

	    // TODO: need refine
	    // If element already openned, close it
	    if (config.target.classList.contains('lightense-open')) {
	      return removeViewer();
	    }

	    // Save current window scroll position for later use
	    config.scrollY = w.scrollY;

	    // Save target attributes
	    config.background = config.target.getAttribute('data-background') || false;
	    config.padding = config.target.getAttribute('data-padding') || defaults.padding;

	    var img = new Image();
	    img.onload = function () {
	      createTransform(this);
	      createViewer();
	      bindEvents();
	    };
	    img.src = config.target.src;
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

	  // Exit on excape (esc) key pressed
	  function onKeyUp(event) {
	    event.preventDefault();
	    if (event.keyCode === 27) {
	      removeViewer();
	    }
	  }

	  function main(target) {
	    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};

	    // Parse elements
	    elements = getElements(target);

	    // Parse user options
	    config = _extends({}, defaults, options);

	    // Prepare stylesheets
	    createStyle();

	    // Prepare backdrop element
	    createBackdrop();

	    // Pass and prepare elements
	    startTracking(elements);
	  }

	  return main;
	};

	var singleton = Lightense();

	module.exports = singleton;

/***/ }
/******/ ])
});
;
