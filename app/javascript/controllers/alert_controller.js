import { Controller } from "@hotwired/stimulus"
import { Alert } from "bootstrap"

export default class extends Controller {
  static targets = [ "alert" ]

  connect() {
    this.alert = Alert.getInstance(this.alertTarget)
  }

  close() {
    this.alert.close()
  }
}
