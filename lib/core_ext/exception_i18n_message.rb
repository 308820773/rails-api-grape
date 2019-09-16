# encoding: utf-8
require 'active_support/inflector'

# Mixin-exception class, add `i18n_message` method
class Exception
  def i18n_message
    # Find translated messages from scope of exception class name
    # like `image_save_error` for `ImageSaveError` class.
    I18n.t message, scope: "exceptions.#{self.class.to_s.underscore}"
  end
end
