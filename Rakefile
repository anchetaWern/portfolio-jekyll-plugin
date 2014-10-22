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