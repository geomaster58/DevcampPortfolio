module ApplicationHelper
 def login_helper style = ""
    if current_user.is_a?(GuestUser)
    (link_to "Register", new_user_registration_path, method: :get, class: style )+ 

     " ".html_safe+

     (link_to "Sign In", new_user_session_path, method: :get, class: style)  
     
    else 
     link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end 
  end
  
  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout", class: "source-greeting") 


    end
  end


   def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: tech_news_path,
        title: "Tech News"
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end


  def alerts 
    alert = (flash[:alert] || flash[:notice] || flash[:error])

    if alert
       alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title:  "Portfolio Site", time: 900, sticky: false)
  end  

end

