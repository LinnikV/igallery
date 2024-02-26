import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  clearInput() {
    this.element.reset()
  }
}
