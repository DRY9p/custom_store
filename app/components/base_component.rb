# frozen_string_literal: true

class BaseComponent < ViewComponent::Base
  private 

  def merge_classes(default, custom)
    [default, custom].compact.join(' ')
  end

  # Notes
  # https://coderwall.com/p/ftbmsa/render-template-if-exists-in-rails
  # https://apidock.com/rails/ActionController/Base/template_exists%3F
  # Определяем контекст класса(BaseComponent), из которого будет извлечён метод .template_exist?
  # https://apidock.com/rails/ActionView/LookupContext/ViewPaths/template_exists%3F
  # https://apidock.com/rails/v7.1.3.4/String/underscore

  def self.template_exist?
    component_path = Rails.root.join("app/components/#{name.underscore}/#{name.demodulize.underscore}.html.erb")
    File.exist?(component_path)
  end
  
  # https://apidock.com/rails/Module/delegate
  delegate :content_tag, :link_to, to: :helpers
end
