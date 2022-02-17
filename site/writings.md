---
layout: page
title: Writings
permalink: /writings/
---

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }} <small>{{ post.date | date: '%B %d, %Y'}}</small></a>
    </li>
  {% endfor %}
</ul>
