class SearchsController < ApplicationController
  def index
    query = params[:key_word].downcase
    categories = Category.where('name LIKE ?', '%' + query + '%')
    roles = Role.where('name LIKE ?', '%' + query + '%')
    @category_hacks = []
    @role_hacks = []
    categories.each do |category|
      @category_hacks.push(Hack.where(category_id: category.id))
    end
    roles.each do |role|
      @role_hacks.push(Hack.where(role_id: role.id))
    end
    @category_hacks.flatten!
    @role_hacks.flatten!

  end
end
