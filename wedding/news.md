---
layout: page
title: News
fa-icon: edit
permalink: /news/
---

We'll continue to post updates here, which you can subscribe to below.

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

<hr style="margin-top: 50px;">
  <p style="margin: 8px 0 0;">
    Follow us on
    <a target="_blank" href="https://twitter.com/{{site.twitter_username }}">Twitter</a>
    for updates, or subscribe to posts via
    <a target="_blank" href="{{ "/feed.xml" | prepend: site.baseurl }}">
      <i class="fa fa-fw fa-rss"></i>RSS</a>
      <!-- a title="What is RSS?" target="_blank" href="http://www.problogger.net/what-is-rss/"><i class="fa fa-fw fa-question-circle"></i></a-->
     <!--
     or
    <form method='post' action='http://blogtrottr.com'>
      Email:
      <input type='text' name='btr_email' />
      <input type='hidden' name='btr_url' value='http://steveamandagetmarried.info/feed.xml' />
      <input type='hidden' name='schedule_type' value='6' />
      <input type='submit' value='Subscribe' />
    </form>
    -->

  </p>

</div>
