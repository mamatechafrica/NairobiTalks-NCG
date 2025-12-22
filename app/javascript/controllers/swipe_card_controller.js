import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    id: Number,
    upvoteUrl: String,
    downvoteUrl: String
  }

  connect() {
    this.startX = 0
    this.currentX = 0
    this.isDragging = false
  }

  start(event) {
    this.startX = this.clientX(event)
    this.isDragging = true
    this.element.style.transition = 'none'
  }

  move(event) {
    if (!this.isDragging) return

    this.currentX = this.clientX(event) - this.startX
    const rotate = this.currentX / 10

    this.element.style.transform = `translateX(${this.currentX}px) rotate(${rotate}deg)`

    const likeOverlay = this.element.querySelectorAll('.pointer-events-none')[0]
    const nopeOverlay = this.element.querySelectorAll('.pointer-events-none')[1]
    const opacity = Math.abs(this.currentX) / 100

    if (this.currentX > 0) {
      likeOverlay.style.opacity = opacity
      nopeOverlay.style.opacity = 0
    } else {
      nopeOverlay.style.opacity = opacity
      likeOverlay.style.opacity = 0
    }
  }

  end(event) {
    if (!this.isDragging) return
    this.isDragging = false

    const threshold = window.innerWidth * 0.3

    if (Math.abs(this.currentX) > threshold) {
      const direction = this.currentX > 0 ? 'right' : 'left'
      this.flyAway(direction)
      this.vote(direction)
    } else {
      this.resetCard()
    }
  }

  handleKey(event) {
    if (event.key === "ArrowRight") {
      this.flyAway('right')
      this.vote('right')
    } else if (event.key === "ArrowLeft") {
      this.flyAway('left')
      this.vote('left')
    }
  }

  flyAway(direction) {
    const x = direction === 'right' ? window.innerWidth + 200 : -window.innerWidth - 200
    const rotate = direction === 'right' ? 30 : -30

    this.element.style.transition = 'transform 0.6s cubic-bezier(0.18, 0.89, 0.32, 1.28)'
    this.element.style.transform = `translateX(${x}px) rotate(${rotate}deg)`

    setTimeout(() => {
      this.element.remove()
      this.checkForMoreCards()
    }, 600)
  }

  resetCard() {
    this.element.style.transition = 'transform 0.3s ease'
    this.element.style.transform = ''
    this.element.querySelectorAll('.pointer-events-none').forEach(el => {
      el.style.opacity = 0
    })
  }

  vote(direction) {
    const url = direction === 'right' ? this.upvoteUrlValue : this.downvoteUrlValue
    fetch(url, {
      method: 'POST',
      headers: {
        'X-CSRF-Token': document.querySelector('[name="csrf-token"]').content,
        'Accept': 'text/vnd.turbo-stream.html'
      }
    })
  }

  checkForMoreCards() {
    // Optional: Add Turbo Stream to preload more cards when stack is low
  }

  clientX(event) {
    return event.touches ? event.touches[0].clientX : event.clientX
  }
}