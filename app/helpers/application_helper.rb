module ApplicationHelper
    def custom_bootstrap_flash
        flash_messages = []
        flash.each do |type, message|
            type = 'success' if type == 'notice'
            type = 'error'   if type == 'alert'
            text = "<script>toastr.#{type}('#{message}');</script>"
            flash_messages << text.html_safe if message
        end
        flash_messages.join("\n").html_safe
    end

    # Returns true if the given user is the current user.
    def current_user?(user)
        user == current_user
    end
end
