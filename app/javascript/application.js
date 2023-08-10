import "@hotwired/turbo-rails";
import "controllers";
var csrfToken = document
  .querySelector("meta[name=csrf-token]")
  .getAttribute("content");
