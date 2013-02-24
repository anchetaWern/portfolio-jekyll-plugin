#Portfolio Jekyll Plugin

This Jekyll Plugin is used for easily rendering images 
from the filesystem.


##How to Use

Copy `portfolio.rb` into your `plugins` directory. 

You can basically customize the plugin to your liking
but as of now the css only works with the Octopress Slash Theme
with some custom css.

You also have to add the following config options to the `_config.yml` file:

```
portfolio_root: /portfolio
portfolio_img_root: /images/pages/portfolio
portfolio_path: /web_files/blog/octopress/source/images/pages/portfolio
portfolio_url: images/posts/pages/portfolio
```

The `portfolio_root` is the name of the directory where your portfolio is
saved. The `portfolio_img_root` is where the images for your portfolio is
saved. The `portfolio_path` is the actual path in your filesystem where your portfolio is saved. And the `portfolio_url` is the address where you can access
your portfolio from the browser.

You can use the plugin by using liquid tags with the name of the plugin
as the first argument. The second argument is optional if you're rendering 
the main page of your portfolio. 
In the example below the name of the project is `zenoir`

```
{% portfolio zenoir %}
```

Here's a sample project page:

```
---
layout: page
title: "Zenoir"
date: 2013-02-23 07:21
comments: false
sharing: true
footer: true
---


##Project Type

Personal Project


##Project Description

Zenoir Online Classroom is an online learning system which can be used by teachers and students for conducting classes online. It's main feature is the sessions module wherein the teacher can have a discussion with the students using a chat box. This is implemented using Node.js and socket.io to ensure that the messages are distributed in real-time. It has also a distinct way of indicating unread posts by using red stars. There is also an email notification system which sends out emails to the students and teachers whenever a new post is made by a specific user in the classroom.


##Technologies Used

- HTML
- CSS
- JavaScript (jQuery)
- PHP (CodeIgniter)
- MySQL
- jQuery UI
- HTMLKickStart 
- PixelCone Fileuploader




##Github Repo

[Zenoir Online Classroom](https://github.com/anchetaWern/Zenoir-Online-Classroom)



##Screenshots

{% portfolio zenoir %}
```

Lastly you could add the following style to `_article.scss` file
so that the plugin will work out of the box.

```
.gallery{
	width: 100%;
	margin-top: 10px;
	overflow: hidden;
}

.gallery a{ 
	display: inline-block;
	line-height: 1;
	overflow: hidden;
}

.gallery img{
	width: 290px;
	margin: 13px;
	margin-bottom: 0px;
	border-width: 0 5px;
	border: 5px solid #eee;
}

.gallery .gallery-item img{
	height: 180px;
}

.gallery-item{
	float: left;
	width: 320px;
	height: 241px;
	margin-bottom: 30px;
}

.gallery-item h3 {
  text-align: center;
}
```
