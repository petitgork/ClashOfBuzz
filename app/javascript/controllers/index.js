// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)

const arrowElement = document.getElementById("arrow-up");

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  console.log("hello")
  if (document.body.scrollTop > 250 || document.documentElement.scrollTop > 250) {
    arrowElement.classList.remove("d-none");
  } else {
    arrowElement.classList.add("d-none");
  }
}

const arrowElementMatch = document.getElementById("arrow-up-match");
console.log(arrowElementMatch)

window.onscroll = function() {scrollFunctionMatch()};

function scrollFunctionMatch() {
  if (document.body.scrollTop > 250 || document.documentElement.scrollTop > 250) {
    arrowElementMatch.classList.remove("d-none");
  } else {
    arrowElementMatch.classList.add("d-none");
  }
}
