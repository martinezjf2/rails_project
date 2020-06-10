- i want to display the notes of the book on the page, getting stuck on  that.
- i want the title to be next to the author first and last name,(books#index)

- when i delete the book as well, it deletes the book but does not properly redirect

- send me a link about the hidden fields, and what were they for

- Also want a search to find any search on a title, notes, or author

- when submitting a new book, nothing happens, it does not save, nor it does not redirect.

- adding the link_to for a new_note within the books#show

i want the delete button on the show.html.erb in the book#show
<%= link_to "Delete", user_books_path(@book.user_id), method: :delete, data: { confirm: "Really?" } %>