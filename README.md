portfolio-jekyll-plugin
=======================

This Jekyll Plugin is used for easily rendering images 
from the filesystem.


##How to Use

Copy `portfolio.rb` into your `plugins` directory. 

Add the following into your Octopress `Rakefile`:

```
# usage rake new_project["awesome-project"]
desc "Create a new project in #{source_dir}/projects/project-name"
task :new_project, :title do |t, args|
  if args.title
    title = args.title
  else
    title = get_stdin("Enter the title of your project: ")
  end
  raise "### You haven't set anything up yet. First run `rake install` to set up an Octopress theme." unless File.directory?(source_dir)
  mkdir_p "#{source_dir}/projects/#{title.to_url}"
  mkdir_p "#{source_dir}/images/pages/projects/#{title.to_url}"
  filename = "#{source_dir}/projects/#{title.to_url}/index.markdown"
  puts "Creating new project: #{filename}"
  open(filename, 'w') do |post|
    post.puts "---"
    post.puts "layout: project"
    post.puts "title: \"#{title.gsub(/&/,'&amp;')}\""
    post.puts "comments: false"
    post.puts "sharing: true"
    post.puts "footer: true"
    post.puts "---"
  end
end
```

This would allow you to easily generate all the files needed to start a new project. You can use it by navigating to the root directory of your Octopress installation:

```
cd /home/user/octopress
```

Once you're in there execute the following in the terminal:

```
rake new_project["awesome-project"]
```

Simply replace `awesome-project` with the name of your project. This will create a new folder in your `source/projects` directory and `source/images/projects` with the name you specified. This also creates an `index.makrdown` file inside the `source/projects/awesome-project`. This file is where you will put the details of your project. 

Next, you can now create the main projects page. This is where you will link all of the projects that you have created. You can create the main project page by creating an `index.markdown` on `source/projects` directory. The file would contain something like this:

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

You can always customize the plugin based on the theme that you're using. You can change the HTML structure on the plugin file itself.

Next, add the following config options to the `_config.yml` file:

```
portfolio_root: /portfolio
portfolio_img_root: /images/pages/portfolio
portfolio_path: /web_files/blog/octopress/source/images/pages/portfolio
portfolio_url: images/posts/pages/portfolio
```

The `portfolio_root` is the name of the directory where your portfolio is saved. This is the path where you need to create a separate folder for each project. 

The `portfolio_img_root` is where all the images for each of your project is stored. 

The `portfolio_path` is the actual path in your filesystem where your portfolio is saved. 

And the `portfolio_url` is the address where you can access
your portfolio from the browser.

Inside each project directory, create an `index.markdown` file. This is where you will put the details of your project. You can use the plugin by using liquid tags with the name of the plugin
as the first argument. The second argument is optional if you're rendering 
the main page of your portfolio. 
In the example below the name of the project is `zenoir`

```
{% portfolio zenoir %}
```

Here's some sample content:

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

If you need an example on how the directory is structured, you can check the `source` branch of [my Octopress blog](https://github.com/anchetaWern/anchetawern.github.io/tree/source/source/projects).

##Demo

Demo available [here](http://anchetawern.github.io/projects)

##Todo

- Rake task for generating a smaller version of each project image


##License

The MIT License (MIT)
Copyright (c) <year> <copyright holders>
 
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
