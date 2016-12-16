require 'rails'
require 'medium-editor-insert-plugin-rails/version'

module MediumEditorInsertPluginRails
  module Rails
    if ::Rails.version.to_s < '3.1'
      require 'medium-editor-insert-plugin-rails/railtie'
    else
      require 'medium-editor-insert-plugin-rails/engine'
    end
  end
end
