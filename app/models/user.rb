class User < ActiveRecord::Base
  acts_as_authentic
  has_many :characters
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :guilds, :through => :assignments
  
  def active?
    active
  end
  
  def activate!
    self.active = true
    save
  end
  
  def role_symbols
    role_symbols = Array.new
    role_symbols << :admin if admin?
    roles.each do |role|
      role_symbols << role.name.underscore.to_sym
    end
    role_symbols << :user
    return role_symbols
  end
end
