class ArticleController < ApplicationController
  def index
    @articles = if params[:query].present?

               #               Article.where(title: params[:query]).all
                  Article.__elasticsearch__.search(
                      query: {
                          multi_match: {
                              query: params[:query],
                              fields: ['title']
                          }
                      }
                  ).records
                else
                  []
                end

    @total = @articles.total unless @articles.size.zero?

  end
end
