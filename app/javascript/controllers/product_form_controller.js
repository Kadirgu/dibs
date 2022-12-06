import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="product-form"
export default class extends Controller {
  static targets = ["options", "regularForm", "spottedForm"];

  connect() {
  
  }

  showForm(event) {
    if (event.currentTarget.dataset.formType === "regular") {
      this.regularFormTarget.classList.remove("d-none");
    } else if (event.currentTarget.dataset.formType === "spotted") {
      this.spottedFormTarget.classList.remove("d-none");
    }
    this.optionsTarget.classList.add("d-none");
  }
}
