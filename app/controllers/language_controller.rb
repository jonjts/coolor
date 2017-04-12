class LanguageController < ActionController::Base


  def set_pt
    session[:language] = "pt-BR"
    redirect
  end

  def set_en
    session[:language] = "en"
    redirect
  end
end

private

def redirect
  redirect_to root_path
end
