
- Also want a search to find any search on a title, notes, or author

- change the omniauth to github



New_Notes

  <!--<div class="field<%= ' field_with_errors' if @post.errors[:content].any? %>"> -->
- want to incorporate the css for field with errors if anyfield is missing or incorrect


- login form has to be @user not :user, so when im logged in, i should not be able to go to the /login route (users#new) or the root route (users#home)

- also want to add a search bar in the books#index






<%= search_form_for @search do |f| %>
<%= f.label :title_cont, "Search By Title" %>
<%= f.search_field :title_cont %>
<%= f.submit "Search" %>
<% end %>
<br>
<%= link_to "Reset Search", books_path %>

<br>
<br>

<% @items.each do |item| %>
<li><%= link_to item.title, book_path(item) %> - <%= item.author_last_name %> <%= item.author_last_name%></li>
<% end %>


<br>
<br> -->


