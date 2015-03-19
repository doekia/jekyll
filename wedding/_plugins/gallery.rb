# This plugin is used to generate a photo gallery from a given description file
# author: Jan-David Quesel
module Jekyll
  # Workaround for commit 5b680f8dd80aac1 in jekyll (remove orphaned files in destination)
  # that deletes all the files created by plugins.
  class Site
    def cleanup
    end
  end

  class GalleryTag < Liquid::Tag
    # The options that are passed to bibtex2html

    def split_params(params)
      params.split(" ").map(&:strip)
    end

    def initialize(tag_name, params, tokens)
      super
      args = split_params(params)
      @dir = args[0]
      @desc = args[1]
      p "Processing: " + @desc
    end

    def render(context)

      # get the complete paths for the style file and the source file
      dirpath = File.join(context['site']['source'], @dir)

      outputfile = File.join(context['site']['destination'], context['page']['url'])
      outputfile += 'duh' if outputfile.end_with?('/')
      outputdir = File.dirname(outputfile)

      # ensure that the destination directory exists
      FileUtils.mkdir_p(outputdir)

      # enter the destination directory
      # p "outputdir = #{outputdir}"
      # p "outputfile = #{outputfile}"
      # p "dir = #{@dir}"
      # p "desc = #{@desc}"
      Dir.chdir(outputdir) do
      out_file = File.open(outputfile, 'w')
      out_file.puts '<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js" type="text/javascript"></script>'
      out_file.puts '<link type="text/css" rel="stylesheet" href="' + context['site']['url'] + '/galleria/themes/classic/galleria.classic.css">'
      out_file.puts '<script src="' + context['site']['url'] + '/galleria/galleria-1.4.2.js" type="text/javascript"></script>'
      # out_file.puts '<script src="' + context['site']['url'] + '/galleria/galleria-1.4.2.min.js" type="text/javascript"></script>'
      out_file.puts "<div id=\"galleria\">"

      IO.foreach( File.join(context['site']['source'], @desc) ).each do |line|
        array = line.split(';')
        # out_file.puts "<img src=\"" + context['site']['url'] + "/" + @dir + "/thumbs/" + array[0] + "\" data-big=\"" + context['site']['url'] + "/" + @dir + "/" + array[0] + "\" data-title=" + array[1] + " data-description=" + array[2] + ">\n"
        out_file.puts "<img src=\"" + context['site']['url'] + "/" + @dir + "/" + array[0] + "\" data-big=\"" + context['site']['url'] + "/" + @dir + "/" + array[0] + "\" data-title=" + array[1] + " data-description=" + array[2] + ">\n"
      end

      out_file.puts "</div>"

      out_file.puts '<a id="fullscreen">View Images Fullscreen</a>'

      out_file.puts '<script>'
        out_file.puts 'Galleria.loadTheme(\'' + context['site']['url'] + '/galleria/themes/classic/galleria.classic.min.js\');'
        out_file.puts 'Galleria.run(\'#galleria\');'
        out_file.puts '$(\'#fullscreen\').click(function() {'
      out_file.puts '$(\'#galleria\').data(\'galleria\').toggleFullscreen(); // toggles the fullscreen'
      out_file.puts '});'
      out_file.puts '</script>'

      out_file.close

          # return the produced output
          IO.read(outputfile)
      end
    end
  end
end

# SMH: uncomment to experiment
# Liquid::Template.register_tag('gallery', Jekyll::GalleryTag)