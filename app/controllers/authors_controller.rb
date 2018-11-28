class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
  end

  def new
  end

  def create
    @author = Author.create(author_params)
    #create a new unsave not-yet-validated Author object from form.
    #! mark means save regardless.

    #run the validations without attempting to save to the database, returning true if the Post is valid and false if not.
    if @author.valid? #if the author is valid, do what we usually do.
      @author.save #this returns a status_code of 302, which instructs the browser to performs a NEW REQUEST!(throw the @post away and let the show action worry about re-reading it from the database)
      redirect_to author_path(@author)
    else #if the post is invalid, hold on to @post, because it is now full of useful error messages, and re-render the :new page, which knows how to display them alongside the user's entries
      render :new #response is to the /new page; does the heavy lifting of rendering your application content for use by a browser
    end
  end

  private

  def author_params
    params.permit(:email, :name)
  end
end
