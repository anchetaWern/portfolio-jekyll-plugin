[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=wernancheta&url=https://github.com/anchetaWern/portfolio-jekyll-plugin&title=portfolio-jekyll&language=ruby&tags=github&category=software)

portfolio-jekyll-plugin
=======================

This Jekyll Plugin is used for easily rendering images 
from the filesystem.

###Installing dependencies

This project relies on [Gulp](http://gulpjs.com/) to optimize the images and copy the files to each of their respective directories. Gulp relies on Node, so if you're not familiar with it, go to the Node.js website and figure out how to install it on your system. Once installed, you can install gulp by executing the following on your terminal:

```
npm install gulp -g
```

Next navigate into your octopress directory and then put the `package.json` file in this repository then execute `npm install`. This will install all the dependencies. Once all the dependencies are installed you can also put the `gulpfile.js` in your octopress. We'll look at how to use it later.


###Installing the plugin

Copy `portfolio.rb` into your `plugins` directory. 

###Configuration

Next, add the following to your `_config.yml` file. Mine looks like this, but you have to modify the paths to match yours:

```
portfolio_root: /projects
portfolio_path: /media/wern/Files/files/octopress/source/images/pages/projects
portfolio_img_root: /images/pages/projects
```

The `portfolio_root` is the path that points out to your portfolio when you accessed your blog from the browser.

The `portfolio_path` is the actual path in your filesystem where the images for your portfolio is stored. 

The `portfolio_img_root` is the path that points out to where the images for your portfolio are.

Next, add the contents of the `Rakefile` in this repository to your `Rakefile`. Note that you can modify the portfolio directory, by default its named `portfolio`:

```
portfolio_dir = "portfolio"
```

This would allow you to easily generate all the files needed to start a new project. You can use it by navigating to the root directory of your Octopress installation:

```
cd /home/user/octopress
```

###Creating new projects

Once you're in there execute the following in the terminal:

```
rake new_project["awesome-project"]
```

Simply replace `awesome-project` with the name of your project. This will add the following directory in the portfolio directory you specified:

```
portfolio
 - awesome-project
  - img
  - index.markdown 
```

The `index.markdown` file would have some content prefilled, and it looks like this:

```
---
layout: project
title: "awesome-project"
comments: false
sharing: true
footer: true
published: true
---
```

As you can see it uses `project` as its layout. You can add this layout to Octopress by creating a new file under `octopress/source/_layouts` and add the contents of the `project.html` file in this repository. This will serve as the base layout for all projects. You can modify the layout if you want.

Next, you can now add the images to the `img` directory in your specific project. In our example, the images should be stored in the following path: `octopress/portfolio/awesome-project/img`.

Once you have added some images, you can then use the `portfolio` liquid tag to output the screenshots for your project. In the example below, `zenoir` is the name of the project:

```
{% portfolio zenoir %}
```

Once you're done adding all the details for your project, it should look something like this:

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

###Main project page

Next, you can now create the main projects page. This is where you will link all of the projects that you have created. You can create the main project page by creating an `index.markdown` on the portfolio directory you specified. The file would contain something like this:

```
---
layout: page
title: "portfolio"
comments: false
sharing: true
footer: true
---

##Client Projects


###Ebay Store Automator

Allows sellers to automatically update the prices of products which they sell on ebay.
Prices are based on the current price in the Amazon website and a configurable profit setting.

{% img right /images/pages/projects/esa/small-admin.png 'ESA Admin' %}

####Technologies Used

- HTML
- CSS 
- JavaScript
- PHP 
- Amazon Product Advertising API
- Ebay Trading API

[View More Details](/projects/esa)

## 

###Ecom

Ecom is an e-commerce Wordpress plugin that integrates with online services like Amazon, Ebay, Flickr, and Freebase. It also comes with a Wordpress theme which will be used for its product searching functionalities.


{% img right /images/pages/projects/ecom/small-ecom-portal-home.png 'Ecom Portal Theme Homepage' %}

####Technologies Used

- HTML
- CSS
- PHP
- Amazon Product Advertising API
- flickr API
- eBay Finding API
- Freebase
- Wordpress

[View More Details](/projects/ecom)

## 
```

By default it uses the `page` layout, if you want to use a different layout just create a new layout on the `_layouts` directory of the theme that you're using then just change the value for the layout attribute of your main portfolio page. 
So if you're using the slash theme then the layouts directory is in `.themes/slash/source/_layouts`.

If you want to customize the CSS of the layout that you created, simply edit `scss` files inside the `sass/partials` directory
of the theme that you're using.

Once you're done this is how it will look like:

![portfolio directory](https://dl.dropboxusercontent.com/u/126688107/github/portfolio_dir.PNG)

###Customizing CSS

You can always customize the plugin based on the theme that you're using. You can change the HTML structure on the plugin file itself.

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

###Compiling

Once you're happy with everything, you can now compile the project. Execute the follwing commands in your terminal:

```
gulp
rake generate
rake preview
```

Running `gulp` might take some time depending on how many projects you have on your portfolio. 

If you need an example on how the directory is structured, you can check the `source` branch of [my Octopress blog](https://github.com/anchetaWern/anchetawern.github.io/tree/source/source/projects).

##Demo

Demo available [here](http://anchetawern.github.io/projects)


##License

The MIT License (MIT)
Copyright (c) <year> <copyright holders>
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
