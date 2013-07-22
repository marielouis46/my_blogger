class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@articles = Article.find(params[:id])
		@comment = Comment.new 
		@comment.article_id = @articles.id
	end

	def new
		@articles = Article.new
	end

	def create
		@articles = Article.new(params[:tag])

		flash.notice = "Article '#{@articles.title}' Created "

		redirect_to article_path(@article)
	end

	def destroy
		@articles = Article.find(params[:id])
		@articles.destroy

		flash.notice = "Article '#{@articles.title}' Deleted"

		redirect_to articles_path
	end

	def edit
		@articles = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :body, :tag_list)
	end

	def update
		@articles = Article.find(params[:id])
		@articles.update(article_params)

		flash.notice = "Article '#{@articles.title}' Updated"

		redirect_to articles_path(@articles)
	end	
end
