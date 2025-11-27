<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>KaleidoPlay — Fun Color Lab</title>
  <style>
    :root{
      --bg1: #ff6b6b;
      --bg2: #ffd93d;
      --glass: rgba(255,255,255,0.12);
      --accent: #7bffb2;
      --radius: 14px;
      --glass-border: rgba(255,255,255,0.18);
      --text: rgba(255,255,255,0.95);
    }
    *{box-sizing:border-box}
    html,body{height:100%;margin:0;font-family:Inter,system-ui,Segoe UI,Roboto,Arial;color:var(--text)}
    body{
      background: radial-gradient(circle at 10% 10%, var(--bg1), transparent 20%),
                  radial-gradient(circle at 90% 90%, var(--bg2), transparent 25%),
                  linear-gradient(120deg,var(--bg1),var(--bg2));
      overflow:hidden;
      display:grid;place-items:center;padding:28px;
    }

    .app{
      width:100%;max-width:1100px;height:740px;padding:20px;border-radius:20px;
      background: linear-gradient(180deg, rgba(255,255,255,0.06), rgba(255,255,255,0.02));
      box-shadow: 0 10px 30px rgba(0,0,0,0.35), inset 0 1px 0 rgba(255,255,255,0.02);
      border: 1px solid rgba(255,255,255,0.06);
      position:relative;display:grid;grid-template-columns:1fr 360px;gap:18px;align-items:stretch;
      backdrop-filter: blur(6px) saturate(120%);
    }

    /* Left: canvas playground */
    .playground{position:relative;border-radius:12px;overflow:hidden;background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(0,0,0,0.02));display:flex;flex-direction:column}
    canvas#bgCanvas{position:absolute;inset:0;width:100%;height:100%;display:block}

    .topbar{display:flex;align-items:center;gap:12px;padding:14px}
    .logo{display:flex;align-items:center;gap:10px}
    .logo .symbol{width:44px;height:44px;border-radius:10px;background:linear-gradient(135deg,#fff3 0%, #ffffff11 100%);display:grid;place-items:center;font-weight:700;color:#111}
    .title{font-weight:700;font-size:18px}
    .subtitle{font-size:12px;color:rgba(255,255,255,0.8)}

    .stage{flex:1;display:grid;place-items:center;padding:8px}
    .card{width:92%;height:92%;border-radius:14px;background:linear-gradient(135deg, rgba(255,255,255,0.03), rgba(255,255,255,0.01));border:1px solid var(--glass-border);position:relative;overflow:hidden}

    /* Right: controls */
    .controls{padding:18px;display:flex;flex-direction:column;gap:12px}
    .panel{background:linear-gradient(180deg, rgba(255,255,255,0.02), rgba(255,255,255,0.01));padding:12px;border-radius:12px;border:1px solid var(--glass-border)}
    .row{display:flex;gap:8px;align-items:center}
    label{font-size:13px;color:rgba(255,255,255,0.88);min-width:80px}
    input[type=range]{width:100%}
    .btn{display:inline-flex;align-items:center;gap:8px;padding:10px 14px;border-radius:12px;border:none;background:linear-gradient(90deg, rgba(255,255,255,0.06), rgba(255,255,255,0.02));cursor:pointer;color:var(--text);font-weight:600}
    .btn:active{transform:translateY(1px)}
    .big-btn{width:100%;padding:14px}

    .swatches{display:flex;gap:8px}
    .swatch{width:34px;height:34px;border-radius:8px;border:1px solid rgba(255,255,255,0.09);box-shadow:0 6px 18px rgba(0,0,0,0.22);cursor:pointer}

    .footer-note{font-size:12px;color:rgba(255,255,255,0.7);margin-top:auto}

    /* floating info */
    .info-bubble{position:absolute;right:24px;top:24px;background:linear-gradient(180deg, rgba(255,255,255,0.04), rgba(255,255,255,0.02));padding:10px 12px;border-radius:10px;border:1px solid rgba(255,255,255,0.06);backdrop-filter: blur(6px)}

    /* playful floating blobs (SVG) */
    .blob{position:absolute;filter:blur(18px);opacity:0.55;mix-blend-mode:screen}

    /* responsive small */
    @media (max-width:980px){.app{grid-template-columns:1fr;max-height:calc(100vh - 56px);height:auto}.controls{order:2}.playground{order:1;height:560px}}
  </style>
</head>
<body>
  <div class="app" id="app">
    <div class="playground">
      <div class="topbar">
        <div class="logo">
          <div class="symbol">KP</div>
          <div>
            <div class="title">KaleidoPlay</div>
            <div class="subtitle">Tap, drag & mix — make colorful chaos ✨</div>
          </div>
        </div>
        <div style="margin-left:auto;display:flex;gap:8px;align-items:center">
          <button class="btn" id="randomizeBtn">Randomize</button>
          <button class="btn" id="saveBtn">Save PNG</button>
        </div>
      </div>

      <div class="stage">
        <div class="card" id="card">
          <canvas id="bgCanvas"></canvas>
          <canvas id="fxCanvas"></canvas>

          <div class="info-bubble" id="info">Particles: <span id="pCount">0</span> • Mode: <span id="mode">Flow</span></div>

          <!-- playful blobs -->
          <svg class="blob" style="left:-10%;top:-10%;width:42%;height:42%;" viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
            <defs><linearGradient id="g1" x1="0" x2="1"><stop stop-color="#ff6b6b" offset="0"/><stop stop-color="#ffd93d" offset="1"/></linearGradient></defs>
            <path fill="url(#g1)" d="M43.4,-58.6C57.7,-49.7,70,-34.3,73,-16.8C76,0.6,69.7,20.3,58.2,34.5C46.7,48.6,29.9,57.2,12.2,63.3C-5.6,69.5,-24.5,73.3,-37.6,64.5C-50.6,55.6,-58,34.9,-63.6,14.1C-69.2,-6.6,-73,-27.5,-64.3,-39.6C-55.6,-51.7,-34.4,-55.1,-16.1,-61.3C2.2,-67.5,22.2,-76.6,43.4,-58.6Z" transform="translate(100 100)"/>
          </svg>

        </div>
      </div>
    </div>

    <div class="controls">
      <div class="panel">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:8px">
          <strong>Color Lab</strong>
          <small style="font-size:12px;opacity:0.8">live</small>
        </div>
        <div class="row"><label>Primary</label><input type="color" id="colorA" value="#ff6b6b"></div>
        <div class="row" style="margin-top:8px"><label>Secondary</label><input type="color" id="colorB" value="#ffd93d"></div>
        <div style="height:8px"></div>
        <div class="row"><label>Particles</label><input id="countRange" type="range" min="0" max="1000" value="120"></div>
        <div class="row" style="margin-top:8px"><label>Speed</label><input id="speedRange" type="range" min="0" max="300" value="80"></div>
      </div>

      <div class="panel">
        <strong>Effects</strong>
        <div style="display:flex;gap:8px;margin-top:10px">
          <button class="btn" id="modeFlow">Flow</button>
          <button class="btn" id="modeBurst">Burst</button>
          <button class="btn" id="modeGlow">Glow</button>
        </div>
        <div style="height:10px"></div>
        <div class="swatches">
          <div class="swatch" title="sunset" data-a="#ff6b6b" data-b="#ffd93d" style="background:linear-gradient(90deg,#ff6b6b,#ffd93d)"></div>
          <div class="swatch" title="ocean" data-a="#12c2e9" data-b="#c471ed" style="background:linear-gradient(90deg,#12c2e9,#c471ed)"></div>
          <div class="swatch" title="mint" data-a="#7bffb2" data-b="#6bc6ff" style="background:linear-gradient(90deg,#7bffb2,#6bc6ff)"></div>
          <div class="swatch" title="neon" data-a="#ff4dff" data-b="#00e6a8" style="background:linear-gradient(90deg,#ff4dff,#00e6a8)"></div>
        </div>
      </div>

      <div class="panel">
        <strong>Play</strong>
        <div style="display:flex;gap:8px;margin-top:10px">
          <button class="btn" id="clearBtn">Clear</button>
          <button class="btn" id="toggleSound">Sound: Off</button>
        </div>
        <div style="height:8px"></div>
        <div class="footer-note">Click or drag inside the card to spawn shapes. Try Randomize → Burst for instant confetti!</div>
      </div>
    </div>
  </div>

  <script>
    // --- Setup canvases ---
    const card = document.getElementById('card');
    const bgCanvas = document.getElementById('bgCanvas');
    const fxCanvas = document.getElementById('fxCanvas');
    const pCountEl = document.getElementById('pCount');
    const modeEl = document.getElementById('mode');

    const dpi = window.devicePixelRatio || 1;
    function resize(){
      const r = card.getBoundingClientRect();
      [bgCanvas,fxCanvas].forEach(c=>{
        c.width = Math.floor(r.width * dpi);
        c.height = Math.floor(r.height * dpi);
        c.style.width = r.width+'px';
        c.style.height = r.height+'px';
      });
    }
    window.addEventListener('resize', resize);

    const bgCtx = bgCanvas.getContext('2d');
    const fxCtx = fxCanvas.getContext('2d');

    // Particle system
    let particles = [];
    let particleCount = Number(document.getElementById('countRange').value);
    let speedFactor = Number(document.getElementById('speedRange').value);
    let mode = 'Flow';
    let soundOn = false;

    function random(min, max){return Math.random()*(max-min)+min}
    function hexToRgb(hex){
      const v = hex.replace('#','');
      return {r:parseInt(v.substring(0,2),16),g:parseInt(v.substring(2,4),16),b:parseInt(v.substring(4,6),16)};
    }

    const colorAInput = document.getElementById('colorA');
    const colorBInput = document.getElementById('colorB');

    function fillBackground(){
      const a = colorAInput.value;
      const b = colorBInput.value;
      const w = bgCanvas.width, h = bgCanvas.height;
      const g = bgCtx.createLinearGradient(0,0,w,h);
      g.addColorStop(0,a); g.addColorStop(1,b);
      bgCtx.fillStyle = g;
      bgCtx.fillRect(0,0,w,h);
      // subtle noise
      const noise = bgCtx.createLinearGradient(0,0,w,0);
      noise.addColorStop(0,'rgba(255,255,255,0.02)'); noise.addColorStop(0.5,'rgba(0,0,0,0.02)'); noise.addColorStop(1,'rgba(255,255,255,0.02)');
      bgCtx.fillStyle = noise; bgCtx.fillRect(0,0,w,h);
    }

    function createParticle(x,y,opts={}){
      const angle = random(0,Math.PI*2);
      const speed = (random(20,120) * (speedFactor/100));
      particles.push({x,y,vx:Math.cos(angle)*speed,vy:Math.sin(angle)*speed,life:random(40,160),age:0,size:random(2,14),colorMix:Math.random()});
    }

    function populate(){
      particles = [];
      for(let i=0;i<particleCount;i++){
        createParticle(random(0,fxCanvas.width), random(0,fxCanvas.height));
      }
    }

    // animation loop
    let last = performance.now();
    function tick(t){
      const dt = (t-last)/1000; last = t;
      // background draw
      fillBackground();

      // particles
      fxCtx.clearRect(0,0,fxCanvas.width,fxCanvas.height);
      for(let i=particles.length-1;i>=0;i--){
        const p = particles[i];
        // apply drift based on mode
        if(mode==='Flow'){
          // a gentle curl field
          const cx = fxCanvas.width/2, cy = fxCanvas.height/2;
          const dx = p.x - cx, dy = p.y - cy;
          const dist = Math.hypot(dx,dy)+0.001;
          p.vx += (-dy/dist) * 10 * dt;
          p.vy += (dx/dist) * 10 * dt;
        } else if(mode==='Burst'){
          // nothing extra, fast outward
          p.vx *= 1 - (0.02*dt*30);
          p.vy *= 1 - (0.02*dt*30);
        } else if(mode==='Glow'){
          p.vx += Math.sin((p.age + t*0.002)/10) * 8 * dt;
          p.vy += Math.cos((p.age + t*0.002)/10) * 8 * dt;
        }

        p.x += p.vx * dt;
        p.y += p.vy * dt;
        p.age += 1;

        // draw
        const mix = p.colorMix;
        const a = hexToRgb(colorAInput.value);
        const b = hexToRgb(colorBInput.value);
        const r = Math.floor(a.r * (1-mix) + b.r * mix);
        const g = Math.floor(a.g * (1-mix) + b.g * mix);
        const bl = Math.floor(a.b * (1-mix) + b.b * mix);
        // alpha based on life
        const alpha = Math.max(0, 1 - p.age / p.life);

        fxCtx.beginPath();
        const s = p.size * (0.6 + alpha*0.8);
        const grad = fxCtx.createRadialGradient(p.x,p.y,0,p.x,p.y,s*2);
        grad.addColorStop(0, `rgba(${r},${g},${bl},${0.95*alpha})`);
        grad.addColorStop(0.6, `rgba(${r},${g},${bl},${0.25*alpha})`);
        grad.addColorStop(1, `rgba(${r},${g},${bl},0)`);
        fxCtx.fillStyle = grad;
        fxCtx.arc(p.x,p.y,s,0,Math.PI*2);
        fxCtx.fill();

        // remove offscreen or dead
        if(p.age > p.life || p.x < -100 || p.x > fxCanvas.width+100 || p.y < -100 || p.y > fxCanvas.height+100){
          particles.splice(i,1);
        }
      }

      pCountEl.textContent = particles.length;
      requestAnimationFrame(tick);
    }

    // interactions
    let isDown=false;
    function onDown(e){
      isDown = true;
      spawnFromEvent(e, 18);
    }
    function onMove(e){
      if(!isDown) return;
      spawnFromEvent(e, 6);
    }
    function onUp(){isDown=false}

    function getEventPos(e){
      const rect = fxCanvas.getBoundingClientRect();
      const clientX = e.touches ? e.touches[0].clientX : e.clientX;
      const clientY = e.touches ? e.touches[0].clientY : e.clientY;
      return {x:(clientX-rect.left)*dpi, y:(clientY-rect.top)*dpi};
    }

    function spawnFromEvent(e, amount=6){
      const pos = getEventPos(e);
      for(let i=0;i<amount;i++){
        createParticle(pos.x + random(-20,20), pos.y + random(-20,20));
      }
      if(soundOn) beep(Math.min(amount*80,1000));
    }

    // sound: tiny oscillator beep
    let audioCtx=null;
    function ensureAudio(){ if(!audioCtx) audioCtx = new (window.AudioContext||window.webkitAudioContext)(); }
    function beep(freq=400){
      try{
        ensureAudio();
        const o = audioCtx.createOscillator();
        const g = audioCtx.createGain();
        o.type = 'sine'; o.frequency.value = freq;
        g.gain.value = 0.02; // very soft
        o.connect(g); g.connect(audioCtx.destination);
        o.start(); o.stop(audioCtx.currentTime + 0.08);
      }catch(e){console.warn('audio failed',e)}
    }

    // UI bindings
    document.getElementById('countRange').addEventListener('input', e=>{
      particleCount = Number(e.target.value);
      populate();
    });
    document.getElementById('speedRange').addEventListener('input', e=>{ speedFactor = Number(e.target.value); });

    document.getElementById('randomizeBtn').addEventListener('click', ()=>{
      // random palette
      const randHex = ()=>'#'+Math.floor(Math.random()*16777215).toString(16).padStart(6,'0');
      colorAInput.value = randHex(); colorBInput.value = randHex();
      particleCount = Math.floor(random(30,400)); document.getElementById('countRange').value = particleCount;
      speedFactor = Math.floor(random(10,240)); document.getElementById('speedRange').value = speedFactor;
      populate();
    });

    document.getElementById('saveBtn').addEventListener('click', ()=>{
      const tmp = document.createElement('canvas');
      tmp.width = fxCanvas.width; tmp.height = fxCanvas.height;
      const tctx = tmp.getContext('2d');
      tctx.drawImage(bgCanvas,0,0);
      tctx.drawImage(fxCanvas,0,0);
      const a = document.createElement('a'); a.download='kaleidoplay.png'; a.href = tmp.toDataURL('image/png'); a.click();
    });

    document.getElementById('clearBtn').addEventListener('click', ()=>{ particles=[]; populate(); });
    document.getElementById('toggleSound').addEventListener('click', (e)=>{ soundOn = !soundOn; e.target.textContent = 'Sound: ' + (soundOn? 'On' : 'Off'); if(soundOn) ensureAudio(); });

    // mode buttons
    document.getElementById('modeFlow').addEventListener('click', ()=>{ mode='Flow'; modeEl.textContent=mode; });
    document.getElementById('modeBurst').addEventListener('click', ()=>{ mode='Burst'; modeEl.textContent=mode; burst(); });
    document.getElementById('modeGlow').addEventListener('click', ()=>{ mode='Glow'; modeEl.textContent=mode; });

    function burst(){
      const cx = fxCanvas.width/2, cy = fxCanvas.height/2;
      for(let i=0;i<300;i++) createParticle(cx + random(-40,40), cy + random(-40,40));
      if(soundOn) beep(800);
    }

    // swatches
    document.querySelectorAll('.swatch').forEach(s=>s.addEventListener('click', e=>{
      const a = e.currentTarget.dataset.a, b = e.currentTarget.dataset.b;
      colorAInput.value = a; colorBInput.value = b; fillBackground();
    }));

    // pointer events
    fxCanvas.addEventListener('mousedown', onDown);
    fxCanvas.addEventListener('mousemove', onMove);
    window.addEventListener('mouseup', onUp);
    fxCanvas.addEventListener('touchstart', onDown, {passive:true});
    fxCanvas.addEventListener('touchmove', onMove, {passive:true});
    window.addEventListener('touchend', onUp);

    // initial boot
    resize(); populate(); requestAnimationFrame(tick);

    // ensure canvases match when card moves into view
    const ro = new ResizeObserver(()=>{ resize(); populate(); });
    ro.observe(card);
  </script>
</body>
</html>
