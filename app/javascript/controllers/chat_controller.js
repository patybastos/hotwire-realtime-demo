import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["conversation"]

  connect() {
    this.observer = new MutationObserver(() => this.scrollToLatest())
    this.observer.observe(this.conversationTarget, { childList: true, subtree: true })
    this.scrollToLatest()
  }

  disconnect() {
    this.observer?.disconnect()
  }

  scrollToLatest() {
    this.conversationTarget.scrollTop = this.conversationTarget.scrollHeight
  }
}