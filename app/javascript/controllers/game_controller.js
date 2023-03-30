import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ["hole", "mole", "score", "button", "winPopup", "losePopup"]

  connect() {
    console.log("game controller connected yo");
    console.log(this.popupTarget)
  }

  reset() {
    this.losePopupTarget.classList.add('d-none');
    this.scoreTarget.textContent = 0;
  }


  startGame() {
    console.log("Game started");
    let holes = this.holeTargets;
    let moles = this.moleTargets;
    let lastHole;
    let timeUp = false;
    let score = 0;

    function randomTime(min, max) {
      return Math.round(Math.random() * (max - min) + min);
    }

    function randomHole(holes) {
      const idx = Math.floor(Math.random() * holes.length);
      const hole = holes[idx];
      return hole;
    }

    function peep() {
      const time = randomTime(200, 1000);
      const hole = randomHole(holes);
      hole.classList.add('up');
      setTimeout(() => {
        hole.classList.remove('up');
        if (!timeUp) peep();
      }, time);
    }



    this.scoreTarget.textContent = 0;
    timeUp = false;
    score = 0;
    peep();
    setTimeout(() => {
      console.log("Delayed for 1 second.");
    }, "1000");
    setTimeout(() => {
      timeUp = true
      score = this.scoreTarget.textContent;
      if (score >= 5) {
        console.log("You won!");
        console.log(this.winPopupTarget.classList);
        this.winPopupTarget.classList.remove('d-none');
        console.log(this.winPopupTarget.classList);
      } else {
        this.losePopupTarget.classList.toggle('d-none');
      }
    }, 10000)

  }

  bonk(e) {
    console.log("bonking")
    console.log("trusted", e.isTrusted)
    if(!e.isTrusted) return; // cheater!
    console.log("scoreTargetBonked", this.scoreTarget)
    let score = parseInt(this.scoreTarget.textContent);
    score++;
    this.element.parentNode.classList.remove('up');
    this.scoreTarget.textContent = score;
  }
}
