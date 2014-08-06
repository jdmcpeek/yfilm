class AddAbilityToUsers < ActiveRecord::Migration
  def change
  		#default is normal, rather than 'visitor'; a visitor is one who has not signed in and thus is not a user. 
    add_column :users, :ability, :string, default: 'normal'
  end
end
