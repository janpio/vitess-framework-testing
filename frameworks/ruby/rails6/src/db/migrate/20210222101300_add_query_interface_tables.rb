class AddQueryInterfaceTables < ActiveRecord::Migration[6.1]
	def change
		create_table :author5s do |t|
			t.string :name
			t.timestamps
		end

		create_table :supplier5s do |t|
			t.string :state
			t.timestamps
		end

		create_table :book6s do |t|
			t.belongs_to :author5, foreign_key: true
			t.belongs_to :supplier5, foreign_key: true
			t.string :title
			t.integer :price
			t.integer :year_published
			t.timestamps
		end

		create_table :customer2s do |t|
			t.string :first_name
			t.timestamps
		end

		create_table :order2s do |t|
			t.belongs_to :customer2
			t.integer :status
			t.timestamps
		end

		create_table :reviews do |t|
			t.belongs_to :customer2, foreign_key: true
			t.belongs_to :book6, foreign_key: true
			t.integer :state
			t.integer :rating
			t.string :review
			t.timestamps
		end

		create_join_table :book6s, :order2s do |t|
			t.index :book6_id
			t.index :order2_id
		end
	end
end

