require 'bundler/gem_tasks'

namespace :bower do
  desc "updates javascripts from bower package manager"
  task :update do
    puts `bower install --save medium-editor medium-editor-insert-plugin`
  end

  desc "vendors javascripts and stylesheets for rails assets pipeline"
  task :vendor do
    copy_javascript "bower_components/medium-editor/dist/js/medium-editor.js"
    copy_stylesheet "bower_components/medium-editor/dist/css/medium-editor.css"
    copy_stylesheet "bower_components/medium-editor/dist/css/themes/flat.css"

    copy_javascript "bower_components/blueimp-canvas-to-blob/js/canvas-to-blob.js"
    copy_javascript "bower_components/blueimp-tmpl/js/tmpl.js"
    copy_javascript "bower_components/handlebars/handlebars.runtime.js"
    copy_javascript "bower_components/medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin.js"
    copy_stylesheet "bower_components/medium-editor-insert-plugin/dist/css/medium-editor-insert-plugin-frontend.css"
    copy_stylesheet "bower_components/medium-editor-insert-plugin/dist/css/medium-editor-insert-plugin.css"
    copy_javascript "bower_components/blueimp-load-image/js/load-image.js"
    copy_javascript "bower_components/blueimp-load-image/js/load-image-orientation.js"
    copy_javascript "bower_components/blueimp-load-image/js/load-image-meta.js"
    copy_javascript "bower_components/blueimp-load-image/js/load-image-exif.js"
    copy_javascript "bower_components/blueimp-load-image/js/load-image-exif-map.js"
    copy_javascript "bower_components/blueimp-file-upload/js/vendor/jquery.ui.widget.js"
    copy_javascript "bower_components/blueimp-file-upload/js/cors/jquery.postmessage-transport.js"
    copy_javascript "bower_components/blueimp-file-upload/js/cors/jquery.xdr-transport.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.iframe-transport.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-video.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-validate.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-ui.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-process.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-jquery-ui.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-image.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-audio.js"
    copy_javascript "bower_components/blueimp-file-upload/js/jquery.fileupload-angular.js"
  end
end

def copy_javascript filename
  rel_filename = File.basename(filename)
  puts "vendoring " + rel_filename
  FileUtils.cp filename, File.join("vendor/assets/javascripts", rel_filename)
end

def copy_stylesheet filename
  rel_filename = File.basename(filename)
  puts "vendoring " + rel_filename
  FileUtils.cp filename, File.join("vendor/assets/stylesheets", rel_filename)
end
