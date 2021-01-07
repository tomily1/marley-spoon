# frozen_string_literal: true

class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
    error_404 if @recipe.nil?
  end

  private

  def error_404
    render :file => 'public/404.html', :status => :not_found
  end
end
