portfolio-jekyll-plugin
=======================

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


###Directory Structure

As of the moment this plugin will only work for a specific directory structure.

First you must create a `portfolio` folder on the `octopress/source` directory.
And inside that directory create an `index.markdown` file which contains the following:

```
---
layout: page
title: "portfolio"
date: 2013-02-23 07:21
comments: false
sharing: true
footer: true
---

{% portfolio %}
```

The portfolio liquid tag basically says that we want to output whatever it is thats in the directory specified in the `portfolio_path` that we setup earlier in our `_config.yml` file. So inside the directory that you specified as your `portfolio_path` you should have your projects each with their own folder. So if you have a project called `wp_plugin` then create folder for that and then inside that folder is where you will save the screenshots for that specific project. The image which has a file name with a prefix of `main` will be the one which will show up as the main project image in your portfolio's home page. Just like the one that I have [here](http://anchetawern.github.com/portfolio/).

To add a description and other details for your projects navigate to the `portfolio` folder that you created earlier in the `octopress/source` directory. Inside that directory create new folders with the same name as the folders that you created earlier in your `portfolio_path` directory. So in our example we also need to create the `wp_plugin` folder in this directory. And then inside of it create an `index.markdown` file in which we can put the details for our project and call the portfolio liquid tag just like this:

```
{% portfolio wp_plugin %}
```
  
###Using the Plugin


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
