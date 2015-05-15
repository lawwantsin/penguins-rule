# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  name_on_card     :string(255)
#  card_number      :string(255)
#  card_expires     :string(255)
#  card_security    :string(255)
#  billing_street   :string(255)
#  billing_city     :string(255)
#  billing_state    :string(255)
#  billing_zip      :string(255)
#  billing_country  :string(255)
#  shipping_name    :string(255)
#  shipping_street  :string(255)
#  shipping_city    :string(255)
#  shipping_state   :string(255)
#  shipping_zip     :string(255)
#  shipping_country :string(255)
#  quantity         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Order < ActiveRecord::Base


end
