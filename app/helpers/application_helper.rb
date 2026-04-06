module ApplicationHelper
  def link_to_google_search(query, label = "Chercher sur Google")
    url = "https://www.google.com/search?q=#{CGI.escape(query)}"
    link_to label, url, target: "_blank", class: "btn btn-outline-primary btn-sm"
  end

  def link_to_bing_search(query, label = "Chercher sur Bing")
    url = "https://www.bing.com/search?q=#{CGI.escape(query)}"
    link_to label, url, target: "_blank", class: "btn btn-outline-info btn-sm"
  end
end
