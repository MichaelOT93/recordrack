class AddAlbumCoverToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :album_cover, :string
  end
end
