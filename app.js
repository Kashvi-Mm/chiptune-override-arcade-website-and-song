const coinTrigger = document.getElementById('coin-trigger');
const joystickTrigger = document.getElementById('joystick-trigger'); 
const chaseVideo = document.getElementById('chase-video');

const statusMsg = document.getElementById('status-msg');
const nowPlayingMsg = document.getElementById('now-playing-msg'); 
const speed = document.getElementById('speed');
const screenDisplay = document.querySelector('.game-display');
const roomBg = document.getElementById('room-bg');

let isChasing = false;
let isPaused = false;
let pulseInterval = null;

// Chase start/stop
coinTrigger.addEventListener('click', () => {
  if (isChasing) return; 
  isChasing = true;
  isPaused = false;

  chaseVideo.muted = false; 
  chaseVideo.volume = 1.0; 
  chaseVideo.play().catch(error => {
    console.error("Audio-embedded media file playback failed to initiate:", error);
  });

  screenDisplay.classList.add('booted');

  statusMsg.classList.remove('blink');
  statusMsg.innerText = "CHASE ACTIVE";
  statusMsg.style.color = "#00f0ff";
  statusMsg.style.textShadow = "0 0 8px #00f0ff";

  nowPlayingMsg.innerText = "NOW PLAYING: CHIPTUNE OVERRIDE";
  nowPlayingMsg.style.color = "#00f0ff";
  nowPlayingMsg.style.textShadow = "0 0 8px #00f0ff";

  speed.innerText = "165";

  const msPerBeat = 60000 / 68;
  
  if (pulseInterval) clearInterval(pulseInterval);
  
  pulseInterval = setInterval(() => {
    if (isPaused) return;

    roomBg.classList.add('pulse-beat');
    
    setTimeout(() => {
      roomBg.classList.remove('pulse-beat');
    }, 240); 
  }, msPerBeat);
});

// Pause
joystickTrigger.addEventListener('click', () => {
  if (!isChasing) return;

  if (!isPaused) {
    isPaused = true;
    chaseVideo.pause();
    statusMsg.innerText = "CHASE PAUSED";
    speed.innerText = "000";
  } else {
    isPaused = false;
    chaseVideo.play().catch(err => console.log("Resume engine break:", err));
    statusMsg.innerText = "CHASE ACTIVE";
    speed.innerText = "165";
  }
});

// Finishhh
chaseVideo.addEventListener('ended', () => {
  if (pulseInterval) {
    clearInterval(pulseInterval);
  }
  statusMsg.innerText = "CHASE COMPLETE! INSERT COIN TO RESTART";
  statusMsg.style.color = "#ff007f";
  statusMsg.style.textShadow = "0 0 8px #ff007f";

  nowPlayingMsg.innerText = "";
  nowPlayingMsg.style.color = "rgba(255, 255, 255, 0.5)";
  nowPlayingMsg.style.textShadow = "none";

  speed.innerText = "000"; 
  screenDisplay.classList.remove('booted');
  isChasing = false; 
  isPaused = false;
});
