class StaticPagesController < ApplicationController
  def home
    @candidates = Candidate.all
    @companies = Company.all
    @offers = Offer.all
    @articles = Article.all
  end
end
