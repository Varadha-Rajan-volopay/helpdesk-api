class CreateTickets < ActiveRecord::Migration[8.1]
    def change
        create_table :tickets do |t|
            t.string :title, null: false
            t.text :description, null: false
            t.string :priority, null: false, default: 'normal'
            t.string :status, null: false, default: 'open'

            t.timestamps
        end
    end
end
