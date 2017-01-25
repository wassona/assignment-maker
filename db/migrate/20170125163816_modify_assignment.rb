class ModifyAssignment < ActiveRecord::Migration[5.0]
  def change
  	add_column :assignments, :label_data, :json
  end
end
