import "@hotwired/turbo-rails";
import "controllers";
import { Turbo } from "@hotwired/turbo-rails";
import { definitionsFromContext } from "@hotwired/stimulus-importmap-autoloader";
import { Application } from "stimulus";

// ...

const application = Application.start();
const context = require.context("../controllers", true, /\.js$/);
application.load(definitionsFromContext(context));

Turbo.start(); // Add this line to start Turbo
