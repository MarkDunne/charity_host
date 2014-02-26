class CreateNewsletterSubscriptions < ActiveRecord::Migration
  def change
    create_table :newsletter_subscriptions do |t|
      t.belongs_to :charity, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
