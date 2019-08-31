module Spree
  class ProductSerializer < ActiveModel::Serializer
    attributes :id,
                :name,
                :description,
                :available_on,
                :permalink,
                :meta_description,
                :meta_keywords,
                :tax_category_id,
                :shipping_category_id,
                :count_on_hand,
                :created_at,
                :updated_at
  end
end
