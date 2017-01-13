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
```

## Configuration

Include javascript file in **app/assets/javascripts/application.js**:

```javascript
//= require medium-editor
//= require medium-editor-insert-plugin-all
```

Include stylesheet file in **app/assets/stylesheets/application.css**:

```css
*= require medium-editor/medium-editor
*= require medium-editor/themes/flat
*= require medium-editor-insert-plugin
```

## Using Medium Editor with Rails

You need to initialize Medium Editor with any selector of div, example:

```html
<div class="editable"></div>

<script>
  var editor = new MediumEditor('.editable', {
    // options go here
  });

  $(function () {
      $('.editable').mediumInsert({
          editor: editor
      });
  });
</script>
```

## Contributing

1. Fork it ( https://github.com/mwlang/medium-editor-insert-plugin-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
