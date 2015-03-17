---
layout: page
title: News
fa-icon: edit
permalink: /blog/
---

<div class="home">
  <ul class="post-list">
    {% for post in site.posts %}
      <li>
        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

        <h2>
          <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>
      </li>
    {% endfor %}
  </ul>

  <p class="rss-subscribe">
    <a target="_blank" href="{{ "/feed.xml" | prepend: site.baseurl }}">
      <i class="fa fa-fw fa-rss"></i>Subscribe via RSS
    </a> <a target="_blank" href="http://www.problogger.net/what-is-rss/"><i class="fa fa-fw fa-question-circle"></i></a>
  </p>

</div>
