class RemoveColumnFromImage < ActiveRecord::Migration[5.2]
  def change
    remove_reference :images, :deal
  end
end
