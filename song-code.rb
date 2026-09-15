use_bpm 68

# Intro
use_synth :pulse
play :d4, pulse_width: 0.1, lpf: 85, release: 0.8
sleep 1
play :bb3, pulse_width: 0.1, lpf: 85, release: 0.8
sleep 1
play :a3, pulse_width: 0.1, lpf: 85, release: 0.8
sleep 1
play :f3, pulse_width: 0.1, lpf: 85, release: 0.8
sleep 0.5
play :e3, pulse_width: 0.1, lpf: 85, release: 0.8
sleep 0.5

# Bass 1
live_loop :synthits do
  28.times do
    use_synth :pulse
    play :d3, pulse_width: 0.05, lpf: 75, release: 0.2, amp: 0.5
    use_synth :tri
    play :d2, lpf: 60, release: 0.2, amp: 0.5
    sleep 0.25
  end
  
  2.times do
    use_synth :pulse
    play :f3, pulse_width: 0.05, lpf: 75, release: 0.2, amp: 0.5
    use_synth :tri
    play :f2, lpf: 60, release: 0.2, amp: 0.5
    sleep 0.25
  end
  
  1.times do
    use_synth :pulse
    play :e3, pulse_width: 0.05, lpf: 75, release: 0.2, amp: 0.5
    use_synth :tri
    play :e2, lpf: 60, release: 0.2, amp: 0.5
    sleep 0.25
  end
  
  1.times do
    use_synth :pulse
    play :d3, pulse_width: 0.05, lpf: 75, release: 0.2, amp: 0.5
    use_synth :tri
    play :d2, lpf: 60, release: 0.2, amp: 0.5
    sleep 0.25
  end
end

# Bass 2
sleep 8
live_loop :bass do
  use_synth :tri
  play :d2, sustain: 8, release: 0.1, lpf: 65, amp: 0.6
  
  play :a2, sustain: 7, release: 0.1, lpf: 65, amp: 0.25
  sleep 7
  
  play :f2, sustain: 0.5, release: 0.05, lpf: 65, amp: 0.6
  sleep 0.5
  play :e2, sustain: 0.5, release: 0.05, lpf: 65, amp: 0.6
  sleep 0.5
end

# Kick and Snare
live_loop :groove do
  kick_pattern  = (ring 1, 0, 0, 0,  0, 0, 0, 0,  1, 0, 0, 0,  0, 0, 0, 0, 1, 0, 0, 0,  0, 0, 0, 0,  1, 0, 0, 0,  0, 0, 0, 0)
  snare_pattern = (ring 0, 0, 0, 0,  1, 0, 0, 0,  0, 0, 0, 0,  1, 0, 0, 0, 0, 0, 0, 0,  1, 0, 0, 0,  0, 0, 0, 0,  1, 0, 1, 0)
  8.times do
    tick
    if kick_pattern.look == 1
      use_synth :tri
      k = play :g2, note_slide: 0.04, release: 0.15, amp: 0.8
      control k, note: :c1
    end
    if snare_pattern.look == 1
      use_synth :noise
      play :c4, attack: 0.01, sustain: 0.02, release: 0.1, lpf: 85, amp: 0.35
    end
    sleep 0.25
  end
end

# Hi hats
live_loop :hihats, sync: :groove_core do
  with_swing 0.05, pulse: 2 do
    use_synth :noise
    play :c6, release: 0.05, lpf: 110, amp: 0.15
  end
  sleep 0.5
end

sleep 6
live_loop :hihatend, sync: :groove_core do
  use_synth :noise
  play :c6, release: 0.4, lpf: 100, amp: 0.1
  sleep 8
end

# Melody
sleep 4
2.times do
  use_synth :saw
  use_synth_defaults pulse_width: 0.4, attack: 0.005, release: 0.15, amp: 0.35, lpf: 105
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
  play :d4
  sleep 0.25
  play :c4
  sleep 0.25
  
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
  play :d4
  sleep 0.25
  play :c4
  sleep 0.25
  
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
  play :d4
  sleep 0.25
  play :c4
  sleep 0.25
  
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :a4
  sleep 0.25
  play :g4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
end

# Melody 2
melody_count = 0
live_loop :chip_melody do
  stop if melody_count >= 240
  
  use_synth :pulse
  melody_notes = (ring :d4, :f4, :a4, :d4,  :bb4, :f4, :e4, :d4,  :a4, :f4, :e4, :d4,  :f4, :e4, :f4, :a4)
  tick
  play melody_notes.look, pulse_width: 0.4, attack: 0.005, release: 0.12, amp: 0.3, lpf: 105
  
  melody_count += 1
  sleep 0.125
end
sleep 28

play :f4
sleep 0.25
play :e4
sleep 0.25
play :f4
sleep 0.25
play :d4
sleep 0.5

# Melody 3
4.times do
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
  play :d4
  sleep 0.25
  play :c4
  sleep 0.25
  
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
  play :d4
  sleep 0.25
  play :c4
  sleep 0.25
  
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
  play :d4
  sleep 0.25
  play :c4
  sleep 0.25
  
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :d4
  sleep 0.25
  play :a4
  sleep 0.25
  play :g4
  sleep 0.25
  play :f4
  sleep 0.25
  play :e4
  sleep 0.25
end
