---
title: "Publications"
layout: splash
permalink: /publications/
author_profile: true
---

{% for pub in site.data.publications %}
  <p><strong>{{ pub.title }}</strong><br>
  {{ pub.authors | join: ", " }}<br>
  <em>{{ pub.journal }}</em>, {{ pub.year }}<br>
  <a href="{{ pub.url }}">DOI</a></p>
{% endfor %}

