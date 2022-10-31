require 'rails_helper' 

RSpec.describe Customer_item do 
  it { should belong_to :customer}
  it { should belong_to :item}
end