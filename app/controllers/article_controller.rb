class ArticleController < ApplicationController
    before_action :authenticate_request
    def article_by_user_id
        render json: Article.where(user_id: @current_user.id)
    end
    def show_article_by_id
        #  kuch chhut rha h
        # render json: User.all
        @articles_with_users =  Article.joins(:user)
        render json: @articles_with_users.select("users.*,articles.*")
        # for @article in @articles_with_users
        #     if(@article.id === params[:id])
        #         @found = @article
        #     end
        # end
        # render json: @found
    end
    def show_all_articles
        @articles_with_users = User.joins(:articles).select("users.*,articles.*")
        render json: @articles_with_users
    end
    def create_article
        @category = Category.find_by(name: params[:category_name])
        # render json: @category
        render json: Article.create(title: params[:title],article_desc: params[:article_desc],user_id: @current_user.id,category_id: @category.id, nlikes: params[:nlikes],ncomments: params[:ncomments],imgurl: params[:imgurl])
    end
    def delete_article
        @article_to_delete = Article.find_by(title: params[:title])
        # render json:@article_to_delete
        # if(@current_user.id == @article_to_delete.user_id)
        @article_to_delete.destroy
        # @article_to_delete.destroy
        # redirect_to "/article_by_user_id"
        # render html: "doone with deleting"
    end
    def update_article
        @article_to_update = Article.find_by_id(params[:id])
        @article_to_update.title = params[:title] || @article_to_update.article_title
        @article_to_update.article_desc = params[:article_desc] || @article_to_update.article_desc
        # @current_article.createdOn = params[:createdOn] || @current_article.createdOn
        # @current_article.article_imageURL = params[:article_imageURL] || @current_article.article_imageURL
        @article_to_update.save
        render json: @article_to_update
    end
    def show_articles_by_cat_name
        @category = Category.find_by(name: params[:category_name])
        render json: Article.where(category_id: @category.id)
    end
    def update_user
        @current_user.name = params[:name]
        @current_user.email = params[:email]
        @current_user.description = params[:description]
        @current_user.profile_pic = params[:profile_pic]
        render json: @current_user

    end
    def show_user_profile
        # @user = User.find(id: @current_user.id)
        # render :json => {
        #     :name => @current_user.name,
        #     :description => @current_user.description,
        #     :email => @current_user.email,
        #     :profile_pic => @current_user.profile_pic
        # }
        render json: @current_user
    end
    def increse_likes
        @article = Article.find_by(title: params[:title])
        # render json: @article
        @like = Like.create(user_id: @current_user.id,likes: @current_user.name, article_id: @article.id)
        # @article = Article.find_by(title: params[title])
        # @article.nlikes = @article.nlikes + 1
        # @article.nlikes += 1
        @article.increment!(:nlikes)

    end
    def increse_comments
        @article = Article.find_by(title: params[:title])
        @comment = Comment.create(content: params[:content], user_id: @current_user.id,name: @current_user.name,article_id: @article.id)
        # @article = Article.find_by(title: params[title])
        # @article.comments = @article.comments + 1
        @article.increment!(:ncomments)
    end
    def decrease_likes
        @like = Like.find(user_id: @current_user.id)
        @article = Article.find_by(title: params[:title])

        @like.destroy
        # @article.nlikes = @article.nlikes + 1
        # @article.nlikes += 1
        @article.decrement!(:nlikes)
        # render json: @like
    end
    def decrease_comments
        @comment = Comment.find(user_id: @current_user.id)
        @article = Article.find_by(title: params[:title])
        @comment.destroy
        # @article.nlikes = @article.nlikes + 1
        # @article.nlikes += 1
        @article.decrement!(:ncomments)
    end
    def show_likes_of_article
        render json: Like.where(article_id: params[:article_id])

    end
    def show_comments_of_article
        render json: Comment.where(article_id: params[:article_id])

    end

    # def show_all_comments_by_article_id

    # end

    def delete_user
        @current_user.destroy
        render json: "Deleted user"
    end

end
