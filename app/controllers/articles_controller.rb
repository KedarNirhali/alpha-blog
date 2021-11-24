class ArticlesController < ApplicationController
	def show
		@article = Article.find(params[:id])
	end	

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		#byebug
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(params.require(:article).permit(:title, :description))
		#render plain: @article.inspect
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def update
		#byebug
		@article = Article.find(params[:id])
		if @article.update(params.require(:article).permit(:title, :description))
			flash[:notice] = "Article was updated successfully"
			redirect_to article_path(@article) 
		else
			render 'edit'
		end
	end

	def destroy 
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to article_path

	end
end
