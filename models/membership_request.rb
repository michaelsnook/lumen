class MembershipRequest
  include Mongoid::Document
  include Mongoid::Timestamps
    
  belongs_to :account, index: true
  belongs_to :group, index: true
        
  validates_presence_of :account, :group
  validates_uniqueness_of :account, :scope => :group
      
  def self.fields_for_index
    [:account_id, :group_id]
  end
  
  def self.fields_for_form
    {
      :account_id => :lookup,
      :group_id => :lookup
    }
  end
  
  def self.lookup
    :id
  end

end