class Product < ActiveRecord::Base
	require 'csv' 

  @@mappings = {"﻿EAN"=>:EAN, "MARQUE"=>:MARQUE, "REF FABRICANT"=>:REF_FABRICANT, 
   "CATEGORIES"=> :CATEGORIES, "NOM PRODUIT"=>:NOM_PRODUIT, 
   "DESCRIPTION"=>:DESCRIPTION, "POIDS"=>:POIDS, "LARGEUR"=>:LARGEUR, 
   "PROFONDEUR"=>:PROFONDEUR, "HAUTEUR"=>:HAUTEUR, "STOCK"=>:STOCK, 
   "PRIX ACHAT HT"=>:PRIX_ACHAT_HT, "PORT FR HT"=>:PORT_FR_HT, 
   "PORT DE HT"=>:PORT_DE_HT, "PORT ES HT"=>:PORT_ES_HT, 
   "PORT IT HT"=>:PORT_IT_HT, "DELAI EXPEDITION"=>:DELAI_EXPEDITION, 
   "IMAGE1"=>:IMAGE1, "IMAGE2"=>:IMAGE2, 
   "IMAGE3"=>:IMAGE3, "IMAGE4"=>:IMAGE4}

   def self.import(file)
     CSV.foreach(file.path, :headers => true) do |row|
      row_hash = row.map {|k, v| [@@mappings[k], v] }.to_h
      row = Product.where(EAN: row_hash[:EAN])
      if row.present?
        row.first.update_attributes(row_hash)
      else
       Product.create!(row_hash)
     end
   end
 end

      def self.search(search)
        where("\"EAN\" ILIKE ? 
          OR \"MARQUE\" ILIKE ?
          OR \"CATEGORIES\" ILIKE ?
          OR \"DESCRIPTION\" ILIKE ?
          OR \"NOM_PRODUIT\" ILIKE ?",
          "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
      end
    end
