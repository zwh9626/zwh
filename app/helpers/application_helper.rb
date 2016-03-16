module ApplicationHelper

   def index_no(index,per)
    params[:page] ||= 1
    (params[:page].to_i - 1) * per + index + 1
  end

   def plate_link(path, options)
    color = options[:color] ||= 'red'
    is_first = options[:is_first] ||= false
    s_class = !is_first ? 'publicplate' : 'fristplate'
    link_to path do
      %Q|
        <li>
        <div class="#{s_class} #{color}">
          <h2>#{options[:title]}</h2>
          <p>#{options[:desc]}</p>
        </div>
        </li>
      |.html_safe
    end
   end

   def markdown(text)
    coderayified = CodeRayify.new(:filter_html => true, 
                                  :hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }
    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end

end
