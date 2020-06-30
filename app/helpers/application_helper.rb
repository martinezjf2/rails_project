module ApplicationHelper

    def user_errors(user)
        if user.errors.any?
            content_tag :ul
            user.errors.full_messages.each do |message|
               content_tag(:li, message)
            end
        end
    end

    def show_errors(object)
        if object.errors.any?
            content_tag :ol
             object.errors.full_messages.each do |message| 
                content_tag(:li, message)
                
                
            end
        end
    end
end

    

# <% if @user.errors.any? %>
#     <p>We may have some issues:</p>

#   <ul>
#     <% @user.errors.full_messages.each do |message| %>
#       <li> - <%= message %></li>
#     <%end%>
#   </ul>
#   <br>
#   <br>
# <%end%>