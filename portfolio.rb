# Title: Portfolio Plugin for Jekyll
# Author: Wern Ancheta http://anchetawern.github.com
# Description: Easily output images from a specific directory
#

module Jekyll
  class Portfolio < Liquid::Tag

    def initialize(tag_name, id, tokens)
      super
      @project_folder = id.to_s.strip
    end

    def render(context)

      content = ""
      projects = []

      portfolio_root = context.registers[:site].config['portfolio_root']
      portfolio_img_root = context.registers[:site].config['portfolio_img_root']
      portfolio_dir_path = context.registers[:site].config['portfolio_path']
      portfolio_dir = Dir.new portfolio_dir_path

      if(@project_folder == "")

          portfolio_dir.each do |project|
            if(project != "." && project != "..")
              projects.push(project)

            end
          end

          projects.each do |project_name|
            Dir.foreach(portfolio_dir_path + "/" + project_name) do |screenshot|
              if(screenshot != "." && screenshot != "..")
                
                link = portfolio_root + "/" + project_name
                img = portfolio_img_root + "/" + project_name + "/" + screenshot
                title = File.basename(screenshot, File.extname(screenshot))
                
                if(screenshot.index "main")

                  content += '<div class="gallery-item">'
                  content += '<a rel="gallery1" title="' + title + '" href="' + img + '" class="fancybox"><img src="' + img + '"></a>'
                  content += '<h3><a href="' + link + '">' + project_name + '</a></h3>'
                  content += '</div>'
                end
              end
            end
          end  

      else

        Dir.foreach(portfolio_dir_path + "/" + @project_folder) do |screenshot|
          if(screenshot != "." && screenshot != "..")
            
            link = portfolio_root + "/" + @project_folder
            img = portfolio_img_root + "/" + @project_folder + "/" + screenshot
            title = File.basename(screenshot, File.extname(screenshot))

            real_title = title.sub("small-", "")
            big_img = img.sub("small-", "")

            if(title.index "small-")
              

              content += '<div class="gallery-item">'
              content += '<a rel="gallery1" title="' + real_title + '" href="' + big_img + '" class="fancybox"><img src="' + img + '"></a>'
              content += '</div>'

            end
            
          end
        end

        
      end
      
      

      return content
      
    end
  end
end

Liquid::Template.register_tag('portfolio', Jekyll::Portfolio)

