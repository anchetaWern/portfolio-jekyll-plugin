portfolio-jekyll-plugin
=======================

This Jekyll Plugin is used for easily rendering images 
from the filesystem.


##How to Use

Copy `portfolio.rb` into your `plugins` directory. 
Create a new folder in the `source` directory and name it `portfolio`.
This is where your projects will be stored, each project will have its own folder, and inside the folder 
create the `index.markdown` file (the same as what's generated when you issue a `rake generate` command).
Also create an `index.markdown` file inside the `portfolio` directory. 
Once you're done this is how it will look like:

![portfolio directory](https://dl.dropboxusercontent.com/u/126688107/github/portfolio_dir.PNG)

After that you can create the directory in which the images for each of your projects will be stored.
Mine is stored in the `source/images/pages/portfolio` directory. Again you will have to create a folder
for each of your projects, it should be the same as the one that you have used in the `portfolio` directory, otherwise it won't work.
The image that you want to be the main image (the one that will be shown in the page where all the projects are displayed)
must have a prefix of `main-`. So if you want to use the image for the login page then the name of the image will be `main-login-page.png`.



You can always customize the plugin based on the theme that you're using. You can change the HTML structure on the plugin file itself.

You also have to add the following config options to the `_config.yml` file:

```
portfolio_root: /portfolio
portfolio_img_root: /images/pages/portfolio
portfolio_path: /web_files/blog/octopress/source/images/pages/portfolio
portfolio_url: images/posts/pages/portfolio
```

The `portfolio_root` is the name of the directory where your portfolio is saved. 
The `portfolio_img_root` is where the images for your portfolio is saved. 
The `portfolio_path` is the actual path in your filesystem where your portfolio is saved. And the `portfolio_url` is the address where you can access
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

##License

The MIT License (MIT)
Copyright (c) <year> <copyright holders>
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
