import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-products"
export default class extends Controller {
  connect() {
  }

  update() {
    document.getElementById("searchForm").submit();
    console.log("test");
  }
}
