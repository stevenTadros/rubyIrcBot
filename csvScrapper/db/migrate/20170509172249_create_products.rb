class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :EAN
      t.text :MARQUE
      t.text :REF_FABRICANT
      t.text :CATEGORIES
      t.text :NOM_PRODUIT
      t.text :DESCRIPTION
      t.text :POIDS
      t.text :LARGEUR
      t.text :PROFONDEUR
      t.text :HAUTEUR
      t.text :STOCK
      t.text :PRIX_ACHAT_HT
      t.text :PORT_FR_HT
      t.text :PORT_DE_HT
      t.text :PORT_ES_HT
      t.text :PORT_IT_HT
      t.text :DELAI_EXPEDITION
      t.text :IMAGE1
      t.text :IMAGE2
      t.text :IMAGE3
      t.text :IMAGE4
      t.timestamps null: false
    end
  end
end