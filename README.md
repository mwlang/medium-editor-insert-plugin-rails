# Medium Editor for Rails

This gem integrates [Medium Editor Insert Plugin](https://github.com/orthes/medium-editor-insert-plugin) with Rails asset pipeline.

## Version

The latest version of Medium Editor bundled by this gem is [v2.4.0](https://github.com/orthes/medium-editor-insert-plugin/releases)

## Installation

Include **medium-editor-insert-plugin-rails** in your Rails project's Gemfile:

```ruby
gem 'medium-editor-rails'
gem 'medium-editor-insert-plugin-rails'
```

And then execute:

```bash
bundle install
bundle exec rake insert_plugin:update
```

## Configuration

Include javascript file in **app/assets/javascripts/application.js**:

```javascript
//= require medium-editor
//= require medium-editor-insert-plugin
```

Include stylesheet file in **app/assets/stylesheets/application.css**:

```css
/*
*= require medium-editor/medium-editor
*= require medium-editor/themes/flat
*= require medium-editor-insert-plugin
*/
```

## Using Medium Editor with Rails

You need to initialize Medium Editor with any selector of div, example:

```html
<div class="editable"></div>

<script>
  $(document).ready(function(){
    var editor = new MediumEditor('.editable', {
      // options go here
    });

    $('.editable').mediumInsert({
      editor: editor
    });
  });
</script>
```

## Handle image uploading

Insert Plugin uses [jQuery-File-Upload](https://github.com/blueimp/jQuery-File-Upload/wiki/Options) for uploading images.
If you application has image uploading endpoint on `/images/upload`, plugin configuration may look like:

```html
<script>
  $(document).ready(function(){
    var editor = new MediumEditor('.editable', {
      // options go here
    });

    $('.editable').mediumInsert({
      editor: editor,
      addons: {
        images: {
          fileUploadOptions: {
            url: '/images/upload',
            type: 'post',
            acceptFileTypes: /(.|\/)(gif|jpe?g|png)$/i
          }
        }
      }
    });
  });
</script>

When upload path isn't specified, plugin stores image as binary data inside text.

```

### Add image uploading enpoint to Rails app

You can quickly add image uploading endpoint to you app with **carrierwave** gem.

1. Include **carrierwave** in your Rails project's Gemfile:

```ruby
gem 'carrierwave', '~> 1.0'
```

2. Add **carrierwave** to `/config/environment.rb`
```ruby
# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!
```

3. Generate image uploader
```bash
rails generate uploader Image
```

4. Create `Image` resource
```bash
rails g scaffold Image title:string file:string
rake db:migrate
```

5. Add uploader to `/models/image.rb`
```ruby
class Image < ActiveRecord::Base
  mount_uploader :file, ImageUploader
end
```

6. Add `updload` to `/config/routers.rb`
```ruby
post "images/upload" => "images#upload"
```

7. Add `upload` to `/controllers/images_controller.rb`
```ruby
 def upload
    files = params.require(:files)

    @image = Image.new
    @image.file = files[0]

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json do
          render json: {
            files:
              [
                {
                  url: @image.file.url,
                  thumbnail_url: @image.file.url,
                  name: @image.file_identifier,
                  type: "image/jpeg",
                  size: 0,
                  delete_url: "your_delete_url",
                  delete_type: "DELETE"
                }
              ]
          }
        end
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end
```

You must be enable to upload images using `/images/upload` path.

## Contributing

1. Fork it ( https://github.com/mwlang/medium-editor-insert-plugin-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
