---
layout: splash
title: "Gallery"
permalink: /gallery/
---

<div id="tsparticles" style="position: fixed; z-index: -1; width: 100%; height: 100%; top: 0; left: 0;"></div>

<script src="https://cdn.jsdelivr.net/npm/tsparticles@2.11.1/tsparticles.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
  tsParticles.load("tsparticles", {
    background: { color: { value: "#ffffff" } },
    particles: {
      number: { value: 80, density: { enable: true, value_area: 1000 } },
      color: { value: "#6ec5ff" },
      links: {
        enable: true,
        color: "#6ec5ff",
        distance: 130,
        opacity: 0.3,
        width: 1
      },
      move: { enable: true, speed: 1.5, out_mode: "bounce" },
      size: { value: 3, random: true }
    },
    interactivity: {
      events: {
        onhover: { enable: true, mode: "grab" },
        onclick: { enable: true, mode: "push" }
      },
      modes: {
        grab: { distance: 160, links: { opacity: 0.5 } },
        push: { quantity: 4 }
      }
    },
    detectRetina: true
  });
});
</script>

<style>
.gallery-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 1.5rem;
  margin-top: 2rem;
}

.gallery-container img {
  max-width: 300px;
  height: auto;
  object-fit: contain;
}
</style>

<div class="gallery-container">
  <img src="{{ '/images/gl1.png' | relative_url }}" alt="gl1">
  <img src="{{ '/images/gl2.png' | relative_url }}" alt="gl2">
  <img src="{{ '/images/gl3.png' | relative_url }}" alt="gl3">
  <img src="{{ '/images/gl4.png' | relative_url }}" alt="gl4">
  <img src="{{ '/images/gl6.png' | relative_url }}" alt="gl6">
  <img src="{{ '/images/gl7.png' | relative_url }}" alt="gl7">
  <img src="{{ '/images/gl9.png' | relative_url }}" alt="gl9">
  <img src="{{ '/images/gl10.png' | relative_url }}" alt="gl10">
</div>

