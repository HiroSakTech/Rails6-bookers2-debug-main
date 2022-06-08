# frozen_string_literal: true

class SearchesController < ApplicationController
  def search # rubocop:disable all
    @word = params[:word]
    @model_name = params[:model]
    @search_results =
      case params[:pattern_match]
      when 'exact_match'
        @model_name.classify.constantize.exact_match(@word)
      when 'forward_match'
        @model_name.classify.constantize.forward_match(@word)
      when 'backward_match'
        @model_name.classify.constantize.backward_match(@word)
      when 'partial_match'
        @model_name.classify.constantize.partial_match(@word)
      end
  end
end
