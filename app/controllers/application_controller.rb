class ApplicationController < ActionController::Base
  #Todo esto lo añadimos para obtener el lenguaje configura del navegador del usuario.
  around_action :switch_locale

  def switch_locale(&action)
    I18n.with_locale(locale_from_header, &action)
  end

  private

  def locale_from_header
    request.env["HTTP_ACCEPT_LANGUAGE"]&.scan(/^[a-z]{2}/)&.first
  end
end
