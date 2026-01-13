module CsrfHelpers
  # Returns the current page's CSRF token (from the meta tag)
  def csrf_token
    find('meta[name="csrf-token"]', visible: false)[:content]
  rescue Capybara::ElementNotFound
    nil
  end

  # Submit a POST request to `path` with `params`, attaching the authenticity token.
  # Uses Capybara's driver submit if available; otherwise falls back to submitting a tiny form via JS.
  def post_with_csrf(path, params = {})
    token = csrf_token
    params_with_token = params.merge("authenticity_token" => token)

    if page.driver.respond_to?(:submit)
      page.driver.submit :post, path, params_with_token
    else
      # Fallback: create and submit a hidden form with JS
      form_js = <<~JS
        (function(){
          var params = #{params_with_token.to_json};
          var form = document.createElement('form');
          form.method = 'POST';
          form.action = '#{path}';
          form.style.display = 'none';
          for (var key in params) {
            var input = document.createElement('input');
            input.name = key;
            input.value = params[key];
            form.appendChild(input);
          }
          document.body.appendChild(form);
          form.submit();
        })();
      JS
      page.execute_script(form_js)
    end
  end
end

World(CsrfHelpers)
