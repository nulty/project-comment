import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comments"
export default class extends Controller {
  static targets = ['form']
  connect() {
  }

  newComment(e) {
    let comment = this.formTarget
    if(e.target.dataset['action'] != 'click->comments#newComment') return

    comment.classList.toggle('invisible')
  }

  csrfToken() {
    return document.querySelector('meta[name=csrf-token]').content
  }
}
