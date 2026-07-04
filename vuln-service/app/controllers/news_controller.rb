# frozen_string_literal: true

class NewsController < ApplicationController
  def last
    # Book.find_by()
    fast_query = 'SELECT * FROM'
    fast_query += if params[:search].present?
                    "\"#{params[:search]}\""
                  else
                    '"books"'
                  end
    @records_array = ActiveRecord::Base.connection.execute(fast_query)
  end
end
