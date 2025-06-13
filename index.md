---
layout: splash
title: "Protein Engineering and Structural Genomics"
permalink: /
classes: homepage
---

<div id="tsparticles" style="position: fixed; z-index: -1; width: 100%; height: 100%; top: 0; left: 0;"></div>

<script src="https://cdn.jsdelivr.net/npm/tsparticles@2.11.1/tsparticles.bundle.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
  tsParticles.load("tsparticles", {
    background: { color: { value: "#ffffff" } },
    particles: {
      number: { value: 60, density: { enable: true, value_area: 800 } },
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

<div style="position: relative; z-index: 1; padding: 2rem; text-align: center;">
  <h1>Welcome to the Protein Engineering and Structural Genomics Group</h1>
  <p style="font-size: 1.2rem; max-width: 700px; margin: auto;">
    We develop computational and experimental strategies to understand protein structure and function,
    design therapeutic candidates, and tackle challenges in molecular biology, structural genomics, and immunology.
  </p>
</div>

